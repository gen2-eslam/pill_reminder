import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_reminder/model/register/register_model.dart';
import 'package:pill_reminder/model/register/register_repo/register_repo.dart';
import 'package:pill_reminder/model/verifiy_user/verfiy_user.dart';

part 'auth_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterRepo registerRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinPutController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            code: int.tryParse(pinPutController.text)!));
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
}