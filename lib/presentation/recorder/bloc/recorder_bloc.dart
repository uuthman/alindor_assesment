import 'dart:convert';
import 'package:alindor_assessment/core/firebase_service.dart';
import 'package:alindor_assessment/data/datasource/user_storage.dart';
import 'package:alindor_assessment/data/models/analysis/analysis_request.dart';
import 'package:alindor_assessment/domain/model.dart';
import 'package:alindor_assessment/domain/repository/recorder_repository.dart';
import 'package:alindor_assessment/presentation/recorder/bloc/recorder_event.dart';
import 'package:alindor_assessment/presentation/recorder/bloc/recorder_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

class RecorderBloc extends Bloc<RecorderEvent, RecorderState> {
  final RecorderRepository _repository;
  final UserStorage _storage;
  final FirebaseService _service;

  RecorderBloc(this._repository, this._storage, this._service) : super(RecorderState()) {
    on<RecorderEventInitPlayer>((event, emit) async {
      final user = await _storage.getUser();
      emit(state.copyWith(
          isRecorderInitialized: event.isRecorderInitialized,
          loggedInUser: user?.name == "" ? user?.email : user?.name));
    });
    on<RecorderEvent>((event, emit) async {
      if (event is RecorderEventSendAudio) {
        emit(state.copyWith(state: ViewState.loading));
        final response = await _repository.getTranscription(event.data);
        response.fold(
            (failure) => emit(state.copyWith(
                state: ViewState.failed,
                errorMessage: failure.message)), (item) {
          final data =
              item.data?.channels.first.alternatives.first.transcription ?? "";
          emit(state.copyWith(data: data));
        });
      } else if (event is RecorderEventGetAnalysis) {
        final data = state.data;
        final schema = {
          "humor": 6,
          "loyalty": 8,
          "courage": 4,
          "leadership": 4,
          "personality": 7,
          "summary": "fjffkkfj",
          "qoute": "djfnfkfmkf"
        };

        const prompt =
            "Provide valid JSON output. Based on the speech provided, create a sentiment analysis using the following: Humor, courage, loyalty, and leadership also do an overall personality score, and the score should be over 10. Provide a summary of the speech and a short quote from the speaker. Provide  a column 'humor' for the humor score, a column 'loyalty' representing the loyalty score, a column 'courage' representing the courage score, a column 'leadership' representing the leadership score, a column 'personality; representing the overall personality score, a column 'summary' representing the summary of the speech, and a column 'quote' representing short quote of the speaker";
        final request = AnalysisRequest("gpt-3.5-turbo", {
          "type": "json_object"
        }, [
          {
            "role": "system",
            "content":
                "Provide output in valid JSON. the data schema should be like this:  ${jsonEncode(schema)}"
          },
          {"role": "user", "content": prompt},
          {"role": "user", "content": data ?? ""},
        ]);

        final response = await _repository.getAnalysis(request);
        response.fold(
            (failure) => emit(state.copyWith(
                state: ViewState.failed,
                errorMessage: failure.message)), (item) {
          final content = item.choices.first.messageData?.content;
          final decodedContent = jsonDecode(content ?? "");
          print(decodedContent);
          final data = AnalysedData.fromJson(decodedContent);
          emit(state.copyWith(state: ViewState.success, analysedData: data));
        });
      }
    }, transformer: sequential());
    on<RecorderEventLogOut>((event, emit) {
      _service.signOut();
      _storage.clearData();
    });
  }
}
