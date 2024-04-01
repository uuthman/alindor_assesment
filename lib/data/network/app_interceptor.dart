import 'dart:developer';

import 'package:dio/dio.dart';


class AppInterceptor extends Interceptor {


  AppInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    if (err.response?.statusCode == 401) {

    }
    super.onError(err, handler);
  }
}
