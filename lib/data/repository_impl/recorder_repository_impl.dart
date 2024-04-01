import 'package:alindor_assessment/data/models/analysis/analysis_request.dart';
import 'package:alindor_assessment/domain/model.dart';
import 'package:alindor_assessment/data/mapper/mapper.dart';
import 'package:alindor_assessment/data/network/app_client.dart';
import 'package:alindor_assessment/data/network/error_handler.dart';
import 'package:alindor_assessment/data/network/failure.dart';
import 'package:alindor_assessment/data/network/openai_client.dart';
import 'package:alindor_assessment/domain/repository/recorder_repository.dart';
import 'package:dartz/dartz.dart';

class RecorderRepositoryImpl extends RecorderRepository {
  final AppClient _client;
  final OpenaiClient _openaiClient;

  RecorderRepositoryImpl(this._client, this._openaiClient);

  @override
  Future<Either<Failure, TranscriptionData>> getTranscription(
      List<int> data) async {
    try {
      final response = await _client.getTranscription(data);
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, AnalysisData>> getAnalysis(
      AnalysisRequest request) async {
    try {
      final response = await _openaiClient.getAnalysis(request);
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
