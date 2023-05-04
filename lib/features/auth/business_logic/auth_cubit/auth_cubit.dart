import 'package:bloc/bloc.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:goo_store_app/features/auth/data/models/login_model.dart';
import 'package:goo_store_app/features/auth/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthInitial());
  final AuthRepository _authRepository;
  void loginAndGetUserData({required String email, required String password}) {
    emit(AuthLoading());
    _authRepository
        .loginAndGetUserData(email: email, password: password)
        .then((value) {
      emit(UserLoggedInSuccessfully(value));
    });
  }

  void createAccount(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(AuthLoading());
    _authRepository
        .createAccount(
            name: name, email: email, password: password, phone: phone)
        .then((value) {
      emit(UserLoggedInSuccessfully(value));
    });
  }

 void getUserToken(){
  AppSecureStorage.instance.getToken().then((value) {
    emit(UserTokenLoaded(value!));
  });
 }
}
