part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class UserLoggedInSuccessfully extends AuthState {
  final LoginModel loginModel;

  UserLoggedInSuccessfully(this.loginModel);
}
