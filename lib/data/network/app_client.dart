import 'package:alindor_assessment/data/models/transcription/transcription_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'app_client.g.dart';

@RestApi(baseUrl: "https://api.deepgram.com/")
abstract class AppClient {
  factory AppClient(Dio dio) = _AppClient;

  @POST("v1/listen")
  Future<TranscriptionResponse> getTranscription(@Body() List<int> data);
}
