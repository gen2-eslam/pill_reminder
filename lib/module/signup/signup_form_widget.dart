import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/register/register_cubit.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/widgets/custom_password_form_fieild.dart';
import 'package:pill_reminder/core/widgets/custom_text_form_fieild.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextFormFeild(
            title: "User Name",
            controller: RegisterCubit.get(context).nameController,
            hintText: "must be unique",
            texytStyle: const TextStyle(
              color: ColorsManager.darkblue,
            ),
            validator: (p0) {
              if (p0!.isEmpty) {
                return "please enter your name";
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          CustomTextFormFeild(
            title: "Email ",
            hintText: "example@gmail.com",
            controller: RegisterCubit.get(context).emailController,
            keyboardType: TextInputType.emailAddress,
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
          CustomTextFormFeild(
            title: "Phone number",
            hintText: "0123456789",
            controller: RegisterCubit.get(context).phoneController,
            keyboardType: TextInputType.phone,
            texytStyle: const TextStyle(
              color: ColorsManager.darkblue,
            ),
            validator: (p0) {
              if (p0!.isEmpty) {
                return "please enter your phone number";
              }
              return null;
            },
          ),
          SizedBox(height: 30.h),
          CustomPasswordFormFeild(
            title: "Password",
            hintText: "must be 8 characters",
            controller: RegisterCubit.get(context).passwordController,
            keyboardType: TextInputType.visiblePassword,
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
            title: "Confirm password",
            hintText: "repeat password",
            controller: RegisterCubit.get(context).confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            texytStyle: const TextStyle(
              color: ColorsManager.darkblue,
            ),
            validator: (p0) {
              if (p0!.isEmpty) {
                return "please enter your password";
              }
              if (p0 != RegisterCubit.get(context).passwordController.text) {
                return "passwords don't match";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
