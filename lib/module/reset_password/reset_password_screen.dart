import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            left: 20.w,
            right: 20.w,
            top: context.deviceHeight * 0.10,
          ),
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
                        text: "helloworld@gmail.com",
                        style: TextStyleManager.textStyle15w500
                            .copyWith(color: ColorsManager.darkblue))
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              const CustomPasswordFormFeild(
                  title: "New password", hintText: "must be 8 characters"),
              SizedBox(height: 30.h),
              const CustomPasswordFormFeild(
                  title: "Confirm new password", hintText: "repeat password"),
              SizedBox(height: 60.h),
              CustomElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.successResetPasswordScreen);
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
    );
  }
}
