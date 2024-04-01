class ApiErrorModel {
  String? message;

  ApiErrorModel({this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
    message: json['message']
  );
}