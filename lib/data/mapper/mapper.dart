import 'package:alindor_assessment/data/models/analysis/analysis_response.dart';
import 'package:alindor_assessment/domain/model.dart';
import 'package:alindor_assessment/data/models/transcription/transcription_response.dart';

const empty = "";

extension TranscriptionResponseMapper on TranscriptionResponse? {
  TranscriptionData toDomain() {
    return TranscriptionData(this?.result?.toDomain());
  }
}

extension ResultMapper on Result? {
  ResultData toDomain() {
    return ResultData(
        (this?.channels?.map((p0) => p0.toDomain()) ?? const Iterable.empty())
            .cast<ChannelData>()
            .toList());
  }
}

extension ChannelMapper on Channel? {
  ChannelData toDomain() {
    return ChannelData((this?.alternatives?.map((p0) => p0.toDomain()) ??
            const Iterable.empty())
        .cast<AlternativeData>()
        .toList());
  }
}

extension AlternativeMapper on Alternative? {
  AlternativeData toDomain() {
    return AlternativeData(this?.transcript ?? empty);
  }
}

extension AnalysisResponseMapper on AnalysisResponse? {
  AnalysisData toDomain() {
    return AnalysisData(
        (this?.choices?.map((p0) => p0.toDomain()) ?? const Iterable.empty())
            .cast<ChoiceData>()
            .toList());
  }
}

extension ChoiceMapper on Choice? {
  ChoiceData toDomain() {
    return ChoiceData(this?.message?.toDomain());
  }
}

extension MessageMapper on Message? {
  MessageData toDomain() {
    return MessageData(this?.content ?? empty, this?.role ?? empty);
  }
}

extension ContentMapper on Content? {
  ContentData toDomain() {
    return ContentData(
        (this?.data?.map((p0) => p0.toDomain()) ?? const Iterable.empty())
            .cast<AnalysedData>()
            .toList());
  }
}

extension AnalysisMapper on Analysis? {
  AnalysedData toDomain() {
    return AnalysedData(
        this?.humor ?? 0,
        this?.loyalty ?? 0,
        this?.courage ?? 0,
        this?.leadership ?? 0,
        this?.personality ?? 0,
        this?.summary ?? empty,
        this?.quote ?? empty);
  }
}
