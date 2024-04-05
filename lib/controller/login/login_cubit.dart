import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_reminder/core/helper/keys.dart';
import 'package:pill_reminder/core/services/cache_service.dart';
import 'package:pill_reminder/model/register/register_repo/register_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  AuthRepo loginRepo;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoading());
    final response = await loginRepo.login(
        email: emailController.text, password: passwordController.text);
    response.fold((l) {
      emit(LoginError(error: l.errorMessage));
    }, (r) {
      CacheService.put(key: Keys.token, value: r.personalData.token);
      CacheService.put(key: Keys.name, value: r.personalData.name);
      clearData();
      emit(LoginSuccess(message: r.message));
    });
  }

  void clearData() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
