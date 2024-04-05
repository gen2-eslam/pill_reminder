import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pill_reminder/model/register/register_repo/register_repo.dart';
import 'package:pill_reminder/model/verifiy_user/forget_password.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.resetPasswordRepo})
      : super(ResetPasswordInitial());
  final AuthRepo resetPasswordRepo;
  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> resetPassword(
      {required String email, required String code}) async {
    emit(ResetPasswordLoading());
    print(email);
    print(code);
    final response = await resetPasswordRepo.resetPassword(
      forgetPasswordModel: ForgetPasswordModel(
        email: email,
        code: code,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );
    response.fold((l) {
      emit(ResetPasswordError(error: l.errorMessage));
    }, (r) {
      emit(ResetPasswordSuccess(message: r.message));
    });
  }
}
