part of 'auth_cubit.dart';

abstract class AuthState {}

final class RegisterInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final String message;
  RegisterSuccess({required this.message});
}

final class RegisterError extends AuthState {
  final String error;
  RegisterError({required this.error});
}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String message;
  LoginSuccess({required this.message});
}

final class LoginError extends AuthState {
  final String error;
  LoginError({required this.error});
}


final class VerifyUserSuccess extends AuthState {
  final String message;
  VerifyUserSuccess({required this.message});
}

final class VerifyUserError extends AuthState {
  final String error;
  VerifyUserError({required this.error});
}
final class SendForgetPasswordUserSuccess extends AuthState {
  final String message;
  SendForgetPasswordUserSuccess({required this.message});
}

final class SendForgetPasswordUserError extends AuthState {
  final String error;
  SendForgetPasswordUserError({required this.error});
}
//reset password
final class ResetPasswordSuccess extends AuthState {
  final String message;
  ResetPasswordSuccess({required this.message});
}

final class ResetPasswordError extends AuthState {
  final String error;
  ResetPasswordError({required this.error});
}