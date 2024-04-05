part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordError extends ForgetPasswordState {
  final String errorMessage;
  ForgetPasswordError(this.errorMessage);
}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;
  ForgetPasswordSuccess(this.message);
}

final class SendForgetPasswordUserSuccess extends ForgetPasswordState {
  final String message, email;
  SendForgetPasswordUserSuccess({required this.message, required this.email});
}

final class SendForgetPasswordUserError extends ForgetPasswordState {
  final String error;
  SendForgetPasswordUserError({required this.error});
}
