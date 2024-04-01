import 'package:alindor_assessment/data/models/analysis/analysis_request.dart';
import 'package:alindor_assessment/data/models/analysis/analysis_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'openai_client.g.dart';

@RestApi(baseUrl: "https://api.openai.com/")
abstract class OpenaiClient {
  factory OpenaiClient(Dio dio) = _OpenaiClient;

  @POST("v1/chat/completions")
  Future<AnalysisResponse> getAnalysis(@Body() AnalysisRequest analysisRequest);
}