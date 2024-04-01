import 'package:freezed_annotation/freezed_annotation.dart';


part 'transcription_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "err_msg")
  String? message;
}

@JsonSerializable()
class TranscriptionResponse extends BaseResponse {
  @JsonKey(name: "results")
  Result? result;

  TranscriptionResponse(this.result);

  factory TranscriptionResponse.fromJson(Map<String, dynamic> json) => _$TranscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TranscriptionResponseToJson(this);
}

@JsonSerializable()
class Result {
  List<Channel>? channels;

  Result(this.channels);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}


@JsonSerializable()
class Channel {
  @JsonKey(name: "alternatives")
  List<Alternative>? alternatives;

  Channel(this.alternatives);


  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

@JsonSerializable()
class Alternative {
  @JsonKey(name: "transcript")
  String? transcript;

  Alternative(this.transcript);

  factory Alternative.fromJson(Map<String, dynamic> json) => _$AlternativeFromJson(json);

  Map<String, dynamic> toJson() => _$AlternativeToJson(this);
}