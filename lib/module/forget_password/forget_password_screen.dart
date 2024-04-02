import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/custom_text_form_fieild.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.offWhite,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.r),
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
              const CustomTextFormFeild(
                title: "Email Address",
                hintText: "Enter your email address",
                texytStyle: TextStyle(
                  color: ColorsManager.darkblue,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.otpScreen);
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
                      context.pop();
                      // context.pushNamed(R.kSignUpView);
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
