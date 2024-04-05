import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/forget_password/forget_password_cubit.dart';
import 'package:pill_reminder/core/helper/enums.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_snak_bar.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/custom_text_form_fieild.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        leading: InkWell(
          onTap: () {
            ForgetPasswordCubit.get(context).clearData();
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorsManager.darkblue,
          ),
        ),
      ),
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          FocusScope.of(context).unfocus();
          if (state is SendForgetPasswordUserSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                  text: state.message, colorState: ColorState.sucess),
            );
            context.pushNamed(Routes.otpScreen,
                arguments: {0: state.email, 1: true});
          }
          if (state is SendForgetPasswordUserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(text: state.error, colorState: ColorState.failure),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(25.r),
            child: Form(
              key: ForgetPasswordCubit.get(context).forgetFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  CustomText(
                    text: "Forget Password",
                    style: TextStyleManager.textStyle30w700,
                    color: ColorsManager.green,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    textAlign: TextAlign.start,
                    text:
                        "Don’t worry! It happens. Please enter the email associated with your account.",
                    style: TextStyleManager.textStyle16w400,
                    color: ColorsManager.blackWithOpacity,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextFormFeild(
                    title: "Email Address",
                    hintText: "Enter your email address",
                    keyboardType: TextInputType.emailAddress,
                    controller:
                        ForgetPasswordCubit.get(context).emailController,
                    texytStyle: const TextStyle(
                      color: ColorsManager.darkblue,
                    ),
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      if (ForgetPasswordCubit.get(context)
                          .forgetFormKey
                          .currentState!
                          .validate()) {
                        ForgetPasswordCubit.get(context)
                            .sendforgetPasswordEmail();
                      }
                    },
                    child: CustomText(
                      text: "Send code",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: context.deviceHeight * 0.10),
        alignment: AlignmentDirectional.bottomCenter,
        child: RichText(
          text: TextSpan(
            text: "Remember password? ",
            style: TextStyleManager.textStyle15w400.copyWith(
              color: ColorsManager.blackWithOpacity,
            ),
            children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      ForgetPasswordCubit.get(context).clearData();
                      context.pop();
                    },
                  text: "Log in",
                  style: TextStyleManager.textStyle15w500
                      .copyWith(color: ColorsManager.darkblue))
            ],
          ),
        ),
      ),
    );
  }
}
