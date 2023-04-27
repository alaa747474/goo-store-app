import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio;
  DioHelper(this._dio);

  Future<Response> getData({required String endPoint, String? token}) async {
    Response response = await _dio.get(endPoint,
        options: Options(headers: {
          'authorization': 'Bearer $token',
        }));
    return response;
  }

  Future<Response> postData(
      {required String endPoint, dynamic data, String? token}) async {
    Response response = await _dio.post(endPoint,
        data: data,
        options: Options(headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        }));
    return response;
  }

  Future<Response> putData(
      {required String endPoint, dynamic data, String? token}) async {
    Response response = await _dio.put(endPoint,
        data: data,
        options: Options(headers: {
          'authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        }));
    return response;
  }
}
