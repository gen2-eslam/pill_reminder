import 'package:flutter/gestures.dart';
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
import 'package:pill_reminder/module/signup/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          // ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
          //     text: state.message, colorState: ColorState.sucess));
          context.pushNamed(Routes.otpScreen, arguments: true);
        } else if (state is RegisterError) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   customSnackBar(text: state.error, colorState: ColorState.failure),
          // );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25.r),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                const SignupFormWidget(),
                SizedBox(height: 30.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.green,
                        ),
                      );
                    }
                    return CustomElevatedButton(
                      onPressed: () {
                        if (AuthCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          context.read<AuthCubit>().register();
                        }
                      },
                      child: CustomText(
                        text: "Sign Up",
                        style: TextStyleManager.textStyle18w600,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h),
                Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
