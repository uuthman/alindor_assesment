import 'package:json_annotation/json_annotation.dart';

part 'analysis_response.g.dart';

@JsonSerializable()
class AnalysisResponse {
  @JsonKey(name: "choices")
  List<Choice>? choices;

  AnalysisResponse(
    this.choices,
  );

  factory AnalysisResponse.fromJson(Map<String, dynamic> json) => _$AnalysisResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisResponseToJson(this);
}



@JsonSerializable()
class Choice {
  @JsonKey(name: "message")
  Message? message;


  Choice(
     this.message,
  );

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}

@JsonSerializable()
class Message {
  @JsonKey(name: "content")
  String content;
  @JsonKey(name: "role")
  String? role;

  Message(
    this.content,
    this.role,
  );

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class Content {
  @JsonKey(name: "data")
  List<Analysis>? data;

  Content(
    this.data,
  );

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Analysis {
  @JsonKey(name: "humor")
  int? humor;
  @JsonKey(name: "loyalty")
  int? loyalty;
  @JsonKey(name: "courage")
  int? courage;
  @JsonKey(name: "leadership")
  int? leadership;
  @JsonKey(name: "personality")
  int? personality;
  @JsonKey(name: "summary")
  String? summary;
  @JsonKey(name: "quote")
  String? quote;

  Analysis(
     this.humor,
     this.loyalty,
     this.courage,
     this.leadership,
     this.personality,
     this.summary,
     this.quote,
  );

  factory Analysis.fromJson(Map<String, dynamic> json) => _$AnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisToJson(this);
}