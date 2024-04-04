import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_reminder/core/helper/keys.dart';
import 'package:pill_reminder/core/services/cache_service.dart';
import 'package:pill_reminder/model/register/register_model.dart';
import 'package:pill_reminder/model/register/register_repo/register_repo.dart';
import 'package:pill_reminder/model/verifiy_user/forget_password.dart';
import 'package:pill_reminder/model/verifiy_user/verfiy_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerRepo}) : super(RegisterInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  AuthRepo registerRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinPutController = TextEditingController();
  TextEditingController pinPutFprgetController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
    GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();

    GlobalKey<FormState> pinFormKey = GlobalKey<FormState>();


  bool isforgetPassword = false;

  Future<void> register() async {
    emit(RegisterLoading());
    final response = await registerRepo.register(
      RegisterModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        phone: phoneController.text,
      ),
    );
    response.fold((l) {
      debugPrint(l.errorMessage);
      emit(RegisterError(error: l.errorMessage));
    }, (r) {
      emit(RegisterSuccess(message: r.message));
    });
  }

  Future<void> verifyUser() async {
    emit(RegisterLoading());
    final response = await registerRepo.verifyUser(
        verifyUser: VerifyUser(
            handle: emailController.text,
            code: int.tryParse(pinPutController.text) ?? 0));
    response.fold((l) {
      debugPrint(l.errorMessage);
      emit(VerifyUserError(error: l.errorMessage));
    }, (r) {
      emit(VerifyUserSuccess(message: r.message));
    });
  }

  Future<void> resendCode() async {
    emit(RegisterLoading());
    final response = await registerRepo.sendCodeAgain(
        verifyUser: VerifyUser(
            handle: emailController.text,
            code: int.tryParse(pinPutController.text)!));
    response.fold((l) {
      debugPrint(l.errorMessage);
      emit(VerifyUserError(error: l.errorMessage));
    }, (r) {
      emit(VerifyUserSuccess(message: r.message));
    });
  }

  //login
  Future<void> login() async {
    emit(LoginLoading());
    final response = await registerRepo.login(
        email: emailController.text, password: passwordController.text);
    response.fold((l) {
      emit(LoginError(error: l.errorMessage));
    }, (r) {
      CacheService.put(key: Keys.token, value: r.personalData.token);
      emit(LoginSuccess(message: r.message));
    });
  }

  Future<void> sendforgetPasswordEmail() async {
    emit(RegisterLoading());
    final response = await registerRepo.sendforgetPasswordEmail(
      verifyUser: VerifyUser(handle: emailController.text),
    );
    response.fold((l) {
      emit(SendForgetPasswordUserError(error: l.errorMessage));
    }, (r) {
      emit(SendForgetPasswordUserSuccess(message: r.message));
    });
  }
  //resetPassword
  Future<void> resetPassword() async {
    emit(RegisterLoading());
    final response = await registerRepo.resetPassword(
      forgetPasswordModel: ForgetPasswordModel(
        email: emailController.text,
        code: pinPutFprgetController.text,
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
