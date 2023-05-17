import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/errors/failures.dart';
import 'package:goo_store_app/core/errors/server_error.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/auth/data/models/login_model.dart';
import 'package:goo_store_app/features/auth/data/repositories/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final DioHelper _dioHelper;
  AuthRepository(this._dioHelper);

  @override
  Future<Either<Failure, LoginModel>> loginAndGetUserData(
      {required String email, required String password}) async {
    try {
      Response response = await _dioHelper.postData(
          endPoint: AppEndPoints.login,
          data: {'email': email, 'password': password});
      return right(LoginModel.fromJson(response.data));
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginModel>> createAccount(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    Map<String, dynamic> userData = {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone
    };
    try {
      Response response = await _dioHelper.postData(
          endPoint: AppEndPoints.register, data: userData);
      return right(LoginModel.fromJson(response.data));
    } catch (e) {
      if (e is DioError) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
