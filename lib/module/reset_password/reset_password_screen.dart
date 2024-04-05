import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/reset_password/reset_password_cubit.dart';
import 'package:pill_reminder/core/helper/enums.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_password_form_fieild.dart';
import 'package:pill_reminder/core/widgets/custom_snak_bar.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  final Map<int, dynamic> data;
  // 0 -> email // 1 ->OTP
  const ResetPasswordScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorsManager.darkblue,
          ),
        ),
      ),
      body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            context.pushNamed(Routes.successResetPasswordScreen);
          }
          if (state is ResetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(text: state.error, colorState: ColorState.failure),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: context.deviceHeight * 0.10,
            ),
            child: Form(
              key: ResetPasswordCubit.get(context).formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Reset password",
                    style: TextStyleManager.textStyle30w700,
                    color: ColorsManager.green,
                  ),
                  SizedBox(height: 30.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "We’ve sent a code to ",
                      style: TextStyleManager.textStyle15w400.copyWith(
                        color: ColorsManager.blackWithOpacity,
                      ),
                      children: [
                        TextSpan(
                            text: data[0],
                            style: TextStyleManager.textStyle15w500
                                .copyWith(color: ColorsManager.darkblue))
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomPasswordFormFeild(
                    title: "New password",
                    keyboardType: TextInputType.visiblePassword,
                    controller:
                        ResetPasswordCubit.get(context).passwordController,
                    hintText: "must be 8 characters",
                    texytStyle: const TextStyle(
                      color: ColorsManager.darkblue,
                    ),
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.h),
                  CustomPasswordFormFeild(
                    title: "Confirm new password",
                    hintText: "repeat password",
                    keyboardType: TextInputType.visiblePassword,
                    controller: ResetPasswordCubit.get(context)
                        .confirmPasswordController,
                    texytStyle: const TextStyle(
                      color: ColorsManager.darkblue,
                    ),
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'password not match';
                      }
                      if (p0 !=
                          ResetPasswordCubit.get(context)
                              .passwordController
                              .text) {
                        return 'password not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 60.h),
                  CustomElevatedButton(
                    onPressed: () {
                      if (ResetPasswordCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        FocusScope.of(context).unfocus();

                        ResetPasswordCubit.get(context)
                            .resetPassword(email: data[0], code: data[1]);
                      }
                    },
                    child: CustomText(
                      text: "Reset password",
                      style: TextStyleManager.textStyle18w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
