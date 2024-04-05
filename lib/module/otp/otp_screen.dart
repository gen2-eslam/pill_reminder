import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/auth/auth_cubit.dart';
import 'package:pill_reminder/controller/otp_password/otp_password_cubit.dart';
import 'package:pill_reminder/core/helper/enums.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_snak_bar.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/module/otp/widgets/custom_pin_put.dart';

class OtpScreen extends StatelessWidget {
  final Map<int, dynamic> otp;
  // otp[0] is Email
  // otp[1] is forget password
  const OtpScreen({
    super.key,
    required this.otp,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpPasswordCubit, OtpPasswordState>(
      listener: (context, state) {
        if (state is VerifyUserError) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
              text: state.error, colorState: ColorState.failure));
        }
        if (state is VerifyUserSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: state.message, colorState: ColorState.sucess),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManager.offWhite,
          leading: InkWell(
            onTap: () {
              OtpPasswordCubit.get(context).pinPutController.clear();
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
              left: 25.r,
              right: 25.r,
              top: context.deviceHeight * 0.10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FittedBox(
                  child: CustomText(
                    text: "Please check your email",
                    style: TextStyleManager.textStyle30w700,
                    color: ColorsManager.green,
                  ),
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
                          text: otp[0],
                          style: TextStyleManager.textStyle15w500
                              .copyWith(color: ColorsManager.darkblue))
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                const CustomPinPut(),
                SizedBox(height: 60.h),
                CustomElevatedButton(
                  onPressed: () {
                    if (OtpPasswordCubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      if (otp[1]) {
                        context
                            .pushNamed(Routes.resetPasswordScreen, arguments: {
                          0: otp[0],
                          1: OtpPasswordCubit.get(context).pinPutController.text
                        });
                      }
                      OtpPasswordCubit.get(context).clearData();
                    }
                  },
                  child: CustomText(
                    text: "Verify",
                    style: TextStyleManager.textStyle18w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: otp[1]
            ? null
            : Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                child: TextButton(
                  onPressed: () {
                    OtpPasswordCubit.get(context).resendCode(email: otp[0]);
                  },
                  child: CustomText(
                    text: "Send code again",
                    style: TextStyleManager.textStyle16w400,
                    color: ColorsManager.blackWithOpacity,
                  ),
                ),
              ),
      ),
    );
  }
}
