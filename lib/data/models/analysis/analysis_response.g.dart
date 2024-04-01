// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisResponse _$AnalysisResponseFromJson(Map<String, dynamic> json) =>
    AnalysisResponse(
      (json['choices'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnalysisResponseToJson(AnalysisResponse instance) =>
    <String, dynamic>{
      'choices': instance.choices,
    };

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'message': instance.message,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['content'] as String,
      json['role'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'content': instance.content,
      'role': instance.role,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      (json['data'] as List<dynamic>?)
          ?.map((e) => Analysis.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'data': instance.data,
    };

Analysis _$AnalysisFromJson(Map<String, dynamic> json) => Analysis(
      json['humor'] as int?,
      json['loyalty'] as int?,
      json['courage'] as int?,
      json['leadership'] as int?,
      json['personality'] as int?,
      json['summary'] as String?,
      json['quote'] as String?,
    );

Map<String, dynamic> _$AnalysisToJson(Analysis instance) => <String, dynamic>{
      'humor': instance.humor,
      'loyalty': instance.loyalty,
      'courage': instance.courage,
      'leadership': instance.leadership,
      'personality': instance.personality,
      'summary': instance.summary,
      'quote': instance.quote,
    };
