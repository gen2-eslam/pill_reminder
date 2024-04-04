import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/auth/auth_cubit.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_password_form_fieild.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.offWhite,
        leading: InkWell(
          onTap: () {
            AuthCubit.get(context).pinPutController.clear();
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorsManager.darkblue,
          ),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            context.pushNamed(Routes.successResetPasswordScreen);
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
              key: AuthCubit.get(context).resetFormKey,
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
                            text: AuthCubit.get(context).emailController.text,
                            style: TextStyleManager.textStyle15w500
                                .copyWith(color: ColorsManager.darkblue))
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomPasswordFormFeild(
                    title: "New password",
                    keyboardType: TextInputType.visiblePassword,
                    controller: AuthCubit.get(context).passwordController,
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
                    controller:
                        AuthCubit.get(context).confirmPasswordController,
                    texytStyle: const TextStyle(
                      color: ColorsManager.darkblue,
                    ),
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'password not match';
                      }
                      if (p0 !=
                          AuthCubit.get(context).passwordController.text) {
                        return 'password not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 60.h),
                  CustomElevatedButton(
                    onPressed: () {
                      if (AuthCubit.get(context)
                          .resetFormKey
                          .currentState!
                          .validate()) {
                        AuthCubit.get(context).resetPassword();
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
