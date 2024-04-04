import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/auth/auth_cubit.dart';
import 'package:pill_reminder/core/helper/enums.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_snak_bar.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/module/otp/widgets/custom_pin_put.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerifyUserError) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
              text: state.error, colorState: ColorState.failure));
        }
        if (state is VerifyUserSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: state.message, colorState: ColorState.sucess),
          );
          if (!AuthCubit.get(context).isforgetPassword) {
            AuthCubit.get(context).login().then((value) {
              context.pushNamed(Routes.homeScreen);
            });
          } else {
            context.pushNamed(Routes.successResetPasswordScreen);
          }
        }
      },
      child: Scaffold(
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 25.r,
              right: 25.r,
              top: context.deviceHeight * 0.10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FittedBox(
                  child: CustomText(
                    text: "Please check your email",
                    style: TextStyleManager.textStyle30w700,
                    color: ColorsManager.green,
                  ),
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
                const CustomPinPut(),
                SizedBox(height: 60.h),
                CustomElevatedButton(
                  onPressed: () {
                    if (AuthCubit.get(context)
                        .pinFormKey
                        .currentState!
                        .validate()) {
                      if (!AuthCubit.get(context).isforgetPassword) {
                        AuthCubit.get(context).verifyUser();
                      } else {
                        context.pushNamed(Routes.resetPasswordScreen);
                      }
                    }
                  },
                  child: CustomText(
                    text: "Verify",
                    style: TextStyleManager.textStyle18w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: EdgeInsets.symmetric(vertical: 20.h),
          child: TextButton(
            onPressed: () {
              AuthCubit.get(context).resendCode();
            },
            child: CustomText(
              text: "Send code again",
              style: TextStyleManager.textStyle16w400,
              color: ColorsManager.blackWithOpacity,
            ),
          ),
        ),
      ),
    );
  }
}
