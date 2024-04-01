import 'package:alindor_assessment/domain/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recorder_state.freezed.dart';

@freezed
class RecorderState with _$RecorderState {
  factory RecorderState(
      {@Default(ViewState.initial) ViewState state,
      @Default(false) bool isRecorderInitialized,
      String? errorMessage,
      String? data,
        String? loggedInUser,
      AnalysedData? analysedData}) = _RecorderState;
}

enum ViewState { initial, loading, success, failed }

extension AccessRecorderState on ViewState {
  bool get isInitial => this == ViewState.initial;

  bool get isLoading => this == ViewState.loading;

  bool get isSuccess => this == ViewState.success;

  bool get isFailure => this == ViewState.failed;
}
