import 'package:dartz/dartz.dart';
import 'package:goo_store_app/features/auth/data/models/login_model.dart';

import '../../../../core/errors/failures.dart';

abstract class BaseAuthRepository {
  Future<Either< Failure, LoginModel>> loginAndGetUserData({required String email,required String password});
  Future<Either< Failure, LoginModel>>createAccount({required String email, required String password,required String name,required String phone});
}