import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_password_form_fieild.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/custom_text_form_fieild.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              CustomText(
                text: "Signup",
                style: TextStyleManager.textStyle30w700,
                color: ColorsManager.green,
              ),
              SizedBox(height: 30.h),
              Form(
                child: Column(
                  children: [
                    const CustomTextFormFeild(
                      title: "Email ",
                      hintText: "example@gmail.com",
                      texytStyle: TextStyle(
                        color: ColorsManager.darkblue,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    const CustomTextFormFeild(
                      title: "User Name",
                      hintText: "must be unique",
                      texytStyle: TextStyle(
                        color: ColorsManager.darkblue,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    const CustomPasswordFormFeild(
                      title: "Password",
                      hintText: "must be 8 characters",
                      texytStyle: TextStyle(
                        color: ColorsManager.green,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    const CustomPasswordFormFeild(
                      title: "Confirm password",
                      hintText: "repeat password",
                      texytStyle: TextStyle(
                        color: ColorsManager.green,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              CustomElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.homeScreen);
                },
                child: CustomText(
                  text: "Sign Up",
                  style: TextStyleManager.textStyle18w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: context.deviceHeight * 0.10),
        alignment: AlignmentDirectional.bottomCenter,
        child: RichText(
          text: TextSpan(
            text: "Already have an account?",
            style: TextStyleManager.textStyle15w400.copyWith(
              color: ColorsManager.blackWithOpacity,
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pop();
                  },
                text: " Log in",
                style: TextStyleManager.textStyle15w500.copyWith(
                  color: ColorsManager.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
