import 'dart:typed_data';

import 'package:alindor_assessment/data/models/analysis/analysis_request.dart';
import 'package:alindor_assessment/domain/model.dart';
import 'package:alindor_assessment/data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class RecorderRepository {

  Future<Either<Failure,TranscriptionData>> getTranscription(List<int> data);
  Future<Either<Failure, AnalysisData>> getAnalysis(AnalysisRequest request);
}