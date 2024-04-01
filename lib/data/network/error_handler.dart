import 'package:alindor_assessment/data/network/api_error_model.dart';
import 'package:alindor_assessment/data/network/failure.dart';
import 'package:dio/dio.dart';

enum DataSource {

  badRequest,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  noInternetConnect,
  defaultError,
  unprocessableEntity,
  appError
}


class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if(error is DioException){
      failure = _handleError(error);
    } else {
      failure = DataSource.appError.getFailure();
    }
  }


  Failure _handleError(DioException error) {
    switch(error.type){

      case DioExceptionType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        switch(error.response?.statusCode){
          case ResponseCode.badRequest:
            return DataSource.badRequest.getMessage(error.response!.data);
          case ResponseCode.forbidden:
            return DataSource.unauthorized.getFailure();
          case ResponseCode.unprocessableEntity:
            return DataSource.unprocessableEntity.getMessage(error.response!.data);
          case ResponseCode.notFound:
            return DataSource.unprocessableEntity.getMessage(error.response!.data);
          case ResponseCode.unauthorized:
            return DataSource.unauthorized.getFailure();
          default:
            return DataSource.defaultError.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      case DioExceptionType.unknown:
        return DataSource.defaultError.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.defaultError.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.noInternetConnect.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseMessage.badRequest);
      case DataSource.unauthorized:
        return Failure(ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(ResponseMessage.timeout);
      case DataSource.cancel:
        return Failure(ResponseMessage.defaultError);
      case DataSource.receiveTimeout:
        return Failure(ResponseMessage.timeout);
      case DataSource.sendTimeout:
        return Failure(ResponseMessage.timeout);
      case DataSource.noInternetConnect:
        return Failure(ResponseMessage.socketError);
      case DataSource.defaultError:
        return Failure(ResponseMessage.badRequest);
      case DataSource.appError:
        return Failure(ResponseMessage.appError);
      default:
        return Failure(ResponseMessage.badRequest);
    }
  }
  
  Failure getMessage(Map<String, dynamic> json){
    return Failure(ApiErrorModel.fromJson(json).message ?? ResponseMessage.defaultError);
  }
}

class ResponseMessage {
  static final internalServerError = "";
  static final unauthorized ="";
  static final notFound = "";
  static final socketError = "";
  static final timeout = "";
  static final badRequest = "";
  static final defaultError = "";
  static final appError = "";

}

class ResponseCode {
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unauthorized = 401;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int unprocessableEntity = 422;

}