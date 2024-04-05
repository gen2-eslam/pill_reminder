import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_reminder/model/register/register_repo/register_repo.dart';
import 'package:pill_reminder/model/verifiy_user/verfiy_user.dart';

part 'otp_password_state.dart';

class OtpPasswordCubit extends Cubit<OtpPasswordState> {
  OtpPasswordCubit({required this.otpPasswordRepo})
      : super(OtpPasswordInitial());

  AuthRepo otpPasswordRepo;
  static OtpPasswordCubit get(context) => BlocProvider.of(context);
  //pinFormKey
  final formKey = GlobalKey<FormState>();
  TextEditingController pinPutController = TextEditingController();

  Future<void> verifyUser({required String email}) async {
    emit(OtpPasswordLoading());
    final response = await otpPasswordRepo.verifyUser(
        verifyUser: VerifyUser(
            handle: email, code: int.tryParse(pinPutController.text) ?? 0));
    response.fold((l) {
      debugPrint(l.errorMessage);
      emit(VerifyUserError(error: l.errorMessage));
    }, (r) {
      emit(VerifyUserSuccess(message: r.message));
    });
  }

  Future<void> resendCode({required String email}) async {
    emit(OtpPasswordLoading());
    final response = await otpPasswordRepo.sendCodeAgain(
      verifyUser: VerifyUser(handle: email, code: 000),
    );

    response.fold((l) {
      debugPrint(l.errorMessage);
      emit(VerifyUserError(error: l.errorMessage));
    }, (r) {
      emit(VerifyUserSuccess(message: r.message));
    });
  }

  void clearData() {
    pinPutController.clear();
  }

  @override
  Future<void> close() {
    pinPutController.dispose();
    return super.close();
  }
}
