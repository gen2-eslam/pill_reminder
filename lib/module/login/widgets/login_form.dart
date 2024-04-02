import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/widgets/custom_password_form_fieild.dart';
import 'package:pill_reminder/core/widgets/custom_text_form_fieild.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextFormFeild(
            title: "Email Address",
            hintText: "Enter your email address",
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
        ],
      ),
    );
  }
}
