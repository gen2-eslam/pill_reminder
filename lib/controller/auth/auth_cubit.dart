import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> pinFormKey = GlobalKey<FormState>();


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


  //login


 

  //resetPassword

}
