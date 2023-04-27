import 'package:dio/dio.dart';
import 'package:goo_store_app/core/constants/end_points.dart';
import 'package:goo_store_app/core/service/dio_helper.dart';
import 'package:goo_store_app/features/auth/data/models/login_model.dart';
import 'package:goo_store_app/features/auth/data/repositories/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final DioHelper _dioHelper;
  AuthRepository(this._dioHelper);

  @override
  Future<LoginModel> loginAndGetUserData(
      {required String email, required String password}) async {
    Response response = await _dioHelper.postData(
        endPoint: AppEndPoints.login,
        data: {'email': email, 'password': password});
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<LoginModel> createAccount(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
        Map<String,dynamic> userData={'email':email,'password':password,'name':name,'phone':phone};
    Response response =
        await _dioHelper.postData(endPoint: AppEndPoints.register, data: userData);
    return LoginModel.fromJson(response.data);
  }
}
