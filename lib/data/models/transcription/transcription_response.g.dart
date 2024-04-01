// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) =>
    BaseResponse()..message = json['err_msg'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'err_msg': instance.message,
    };

TranscriptionResponse _$TranscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    TranscriptionResponse(
      json['results'] == null
          ? null
          : Result.fromJson(json['results'] as Map<String, dynamic>),
    )..message = json['err_msg'] as String?;

Map<String, dynamic> _$TranscriptionResponseToJson(
        TranscriptionResponse instance) =>
    <String, dynamic>{
      'err_msg': instance.message,
      'results': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'channels': instance.channels,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      (json['alternatives'] as List<dynamic>?)
          ?.map((e) => Alternative.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'alternatives': instance.alternatives,
    };

Alternative _$AlternativeFromJson(Map<String, dynamic> json) => Alternative(
      json['transcript'] as String?,
    );

Map<String, dynamic> _$AlternativeToJson(Alternative instance) =>
    <String, dynamic>{
      'transcript': instance.transcript,
    };
