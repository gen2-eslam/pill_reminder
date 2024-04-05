part of 'otp_password_cubit.dart';

abstract class OtpPasswordState {}

final class OtpPasswordInitial extends OtpPasswordState {}

final class OtpPasswordLoading extends OtpPasswordState {}

final class VerifyUserSuccess extends OtpPasswordState {
  final String message;
  VerifyUserSuccess({required this.message});
}

final class VerifyUserError extends OtpPasswordState {
  final String error;
  VerifyUserError({required this.error});
}
