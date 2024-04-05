import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_reminder/model/register/register_repo/register_repo.dart';
import 'package:pill_reminder/model/verifiy_user/verfiy_user.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.authRepo})
      : super(ForgetPasswordInitial());

  AuthRepo authRepo;
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();

  Future<void> sendforgetPasswordEmail() async {
    emit(ForgetPasswordLoading());
    final response = await authRepo.sendforgetPasswordEmail(
      verifyUser: VerifyUser(handle: emailController.text),
    );
    response.fold((l) {
      emit(SendForgetPasswordUserError(error: l.errorMessage));
    }, (r) {
      emit(SendForgetPasswordUserSuccess(
          message: r.message, email: emailController.text));
    });
  }

  //clear
  void clearData() {
    emailController.clear();
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
