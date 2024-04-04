import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/auth/auth_cubit.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton(
            onPressed: () {
              AuthCubit.get(context).pinPutController.clear();
              AuthCubit.get(context).emailController.clear();
              AuthCubit.get(context).passwordController.clear();
              AuthCubit.get(context).isforgetPassword = true;
              context.pushNamed(Routes.forgetScreen);
            },
            child: CustomText(
              text: "Forget Password?",
              style: TextStyleManager.textStyle15w400,
              color: ColorsManager.darkblue,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.green,
                ),
              );
            } else {
              return CustomElevatedButton(
                onPressed: () {
                  if (AuthCubit.get(context)
                      .loginFormKey
                      .currentState!
                      .validate()) {
                    AuthCubit.get(context).login();
                    context.pushNamed(Routes.homeScreen);
                  }
                },
                child: CustomText(
                  text: "Login",
                  style: TextStyleManager.textStyle18w600,
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
