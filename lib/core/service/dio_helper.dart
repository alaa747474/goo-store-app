import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';

class DioHelper {
  final Dio _dio;
  DioHelper(this._dio);

  static const String _baseUrl = AppEndPoints.baseUrl;
  Future<Response> getData(
      {String? endPoint = '',
      String? baseUrl = _baseUrl,
      String? token,
      String? lang = 'en',
      Map<String, dynamic>? queryParameters}) async {
    Response response = await _dio.get(baseUrl! + endPoint!,
        queryParameters: queryParameters,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
          'lang': lang,
        }));
    return response;
  }

  Future<Response> postData(
      {required String endPoint,
      String? baseUrl = _baseUrl,
      dynamic data,
      String? token}) async {
    Response response = await _dio.post(baseUrl! + endPoint,
        data: data,
        options: Options(headers: {
          'authorization': token ?? '',
          'Content-Type': 'application/json'
        }));
    return response;
  }

  Future<Response> putData(
      {String? endPoint = '',
      String? baseUrl = _baseUrl,
      dynamic data,
      String? token}) async {
    Response response = await _dio.put(baseUrl! + endPoint!,
        data: data,
        options: Options(headers: {
          'authorization': token ?? '',
          'Content-Type': 'application/json'
        }));
    return response;
  }

  Future<Response> deleteData(
      {String? endPoint = "",
      String? baseUrl = _baseUrl,
      String? token}) async {
    Response response = await _dio.delete(baseUrl! + endPoint!,
        options: Options(headers: {
          'authorization': token ?? '',
          'Content-Type': 'application/json'
        }));
    return response;
  }
}
