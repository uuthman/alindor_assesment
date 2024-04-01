import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_request.g.dart';

@JsonSerializable()
class AnalysisRequest {
  String? model;
  @JsonKey(name: "response_format")
  Map<String,String>? responseFormat;
  List<Map<String,String>>? messages;


  AnalysisRequest(
     this.model,
     this.responseFormat,
     this.messages,
  );

  factory AnalysisRequest.fromJson(Map<String, dynamic> json) => _$AnalysisRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisRequestToJson(this);
}