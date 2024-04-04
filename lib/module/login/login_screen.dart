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
import 'package:pill_reminder/core/utils/string_manager.dart';
import 'package:pill_reminder/core/widgets/custom_snak_bar.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/module/login/widgets/login_buttons.dart';
import 'package:pill_reminder/module/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
              text: state.message, colorState: ColorState.sucess));
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: state.error, colorState: ColorState.failure),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.h),
                CustomText(
                  text: "Login",
                  style: TextStyleManager.textStyle30w700,
                  color: ColorsManager.green,
                ),
                SizedBox(height: 30.h),
                const LoginForm(),
                const LoginButtons(),
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
              text: StringManager.dontHaveAccount,
              style: TextStyleManager.textStyle15w400.copyWith(
                color: ColorsManager.blackWithOpacity,
              ),
              children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.pushNamed(Routes.signUpScreen);
                      },
                    text: StringManager.signUp,
                    style: TextStyleManager.textStyle15w500
                        .copyWith(color: ColorsManager.darkblue))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
