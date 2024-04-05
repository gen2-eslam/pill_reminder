part of 'register_cubit.dart';

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





//reset password
