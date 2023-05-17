import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:goo_store_app/core/cache/app_secure_storage.dart';
import 'package:goo_store_app/core/errors/failures.dart';
import 'package:goo_store_app/features/auth/data/models/login_model.dart';
import 'package:goo_store_app/features/auth/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthInitial());
  final AuthRepository _authRepository;
  void loginAndGetUserData(
      {required String email, required String password}) async {
    emit(AuthLoading());
    Either<Failure, LoginModel> data = await _authRepository
        .loginAndGetUserData(email: email, password: password);
    data.fold((error) {
      emit(AuthFailed(error.errorMessage));
    }, (loginModel) {
      emit(UserLoggedInSuccessfully(loginModel));
    });
  }

  void createAccount(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(AuthLoading());
    Either<Failure, LoginModel> data = await _authRepository.createAccount(
        name: name, email: email, password: password, phone: phone);
    data.fold((error) {
      emit(AuthFailed(error.errorMessage));
    }, (loginModel) {
      emit(UserLoggedInSuccessfully(loginModel));
    });
  }

  void getUserToken() {
    AppSecureStorage.instance.getToken().then((value) {
      if (value != null) {
        emit(UserTokenLoaded(value));
      }
    });
  }
}
