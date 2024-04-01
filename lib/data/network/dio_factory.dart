import 'package:alindor_assessment/data/network/app_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";

class DioFactory {
  DioFactory();

  Future<Dio> getDio(Map<String, String> headers) async {
    Dio dio = Dio();
    // Map<String, String> headers = {
    //   'Content-Type': 'audio/*',
    //   'Authorization': 'Token 7967640dbd81fbd386beb5cf95a0f8124f30d6f6',
    //   'Accept': 'application/json'
    // };

    dio.options = BaseOptions(
        baseUrl: "",
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        headers: headers);

    dio.interceptors.addAll([AppInterceptor()]);

    if (kReleaseMode) {
      print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
