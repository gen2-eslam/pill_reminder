part of 'auth_cubit.dart';


abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess({required this.message});
}
final class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}
final class VerifyUserSuccess extends RegisterState {
  final String message;
  VerifyUserSuccess({required this.message});
}
final class VerifyUserError extends RegisterState {
  final String error;
  VerifyUserError({required this.error});
}
