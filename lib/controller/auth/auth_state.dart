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




//reset password
