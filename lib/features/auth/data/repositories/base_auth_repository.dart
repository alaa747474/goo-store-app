import 'package:goo_store_app/features/auth/data/models/login_model.dart';

abstract class BaseAuthRepository {
  Future<LoginModel> loginAndGetUserData({required String email,required String password});
  Future<LoginModel> createAccount({required String email, required String password,required String name,required String phone});
}