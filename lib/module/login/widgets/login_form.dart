import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/login/login_cubit.dart';
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
      key: LoginCubit.get(context).loginFormKey,
      child: Column(
        children: [
          CustomTextFormFeild(
            title: "Email Address",
            keyboardType: TextInputType.emailAddress,
            controller: LoginCubit.get(context).emailController,
            hintText: "Enter your email address",
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
          SizedBox(height: 30.h),
          CustomPasswordFormFeild(
            title: "Password",
            controller: LoginCubit.get(context).passwordController,
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
        ],
      ),
    );
  }
}
