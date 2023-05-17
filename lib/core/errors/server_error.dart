import 'package:dio/dio.dart';
import 'package:goo_store_app/core/errors/failures.dart';

class ServerError extends Failure {
  ServerError(super.errorMessage);
  factory ServerError.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerError('Connection request timeout');
      case DioErrorType.sendTimeout:
        return ServerError('Send timeout in connection with API server');
      case DioErrorType.receiveTimeout:
        return ServerError('Receive timeout in connection with API server');
      case DioErrorType.badCertificate:
        return ServerError('can’t verify the SSL certificate');
      case DioErrorType.badResponse:
        return ServerError.fromStatusCode(
            dioError.response!.statusCode!, dioError.response);
      case DioErrorType.cancel:
        return ServerError('Request to Server was canceld');
      case DioErrorType.connectionError:
        return ServerError('Connection request timeout');
      case DioErrorType.unknown:
        return ServerError('Opps There was an Error, Please try again');
    }
  }

  factory ServerError.fromStatusCode(int statusCode, dynamic response) {
    switch (statusCode) {
      case 401:
        return ServerError('You are not authorized');
      case 404:
        return ServerError('Not Found');
      case 500:
        return ServerError('Internal Server Error');
      case 429:
        return ServerError('Too many requests');
    }
    return ServerError('Unexpected error occurred');
  }
}
