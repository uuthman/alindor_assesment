import 'dart:convert';

class TranscriptionData {
  ResultData? data;

  TranscriptionData(this.data);
}

class ResultData {
  List<ChannelData> channels;

  ResultData(this.channels);
}

class ChannelData {
  List<AlternativeData> alternatives;

  ChannelData(this.alternatives);
}

class AlternativeData {
  String transcription;

  AlternativeData(this.transcription);
}

class AnalysisData {
  List<ChoiceData> choices;

  AnalysisData(this.choices);
}

class ChoiceData {
  MessageData? messageData;

  ChoiceData(this.messageData);
}

class MessageData {
  String content;
  String role;

  MessageData(this.content, this.role);
}

class ContentData {
  List<AnalysedData> data;

  ContentData(this.data);
}

class AnalysedData {
  int humor;
  int loyalty;
  int courage;
  int leadership;
  int personality;
  String summary;
  String quote;

  AnalysedData(this.humor, this.loyalty, this.courage, this.leadership,
      this.personality, this.summary, this.quote);

  factory AnalysedData.fromJson(Map<String, dynamic> json) => AnalysedData(
        json["humor"],
        json["loyalty"],
        json["courage"],
        json["leadership"],
        json["personality"],
        json["summary"],
        json["quote"],
      );

  Map<String, dynamic> toJson() => {
        "humor": humor,
        "loyalty": loyalty,
        "courage": courage,
        "leadership": leadership,
        "personality": personality,
        "summary": summary,
        "quote": quote,
      };
}

class UserData {
  String name;
  String email;

  UserData(this.name, this.email);

  Map<String, dynamic> toMap() {
    return {'email': email, 'name': name};
  }

  String toJson() => json.encode(toMap());
}
