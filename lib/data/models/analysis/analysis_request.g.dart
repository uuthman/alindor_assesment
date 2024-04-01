// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisRequest _$AnalysisRequestFromJson(Map<String, dynamic> json) =>
    AnalysisRequest(
      json['model'] as String?,
      (json['response_format'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      (json['messages'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$AnalysisRequestToJson(AnalysisRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'response_format': instance.responseFormat,
      'messages': instance.messages,
    };
