import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/utils/string_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  final String text;
  const OtpScreen({super.key, required this.text});

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
                        text: "helloworld@gmail.com",
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
                  context.pushNamed(Routes.resetPasswordScreen);
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
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        child: TextButton(
          onPressed: () {},
          child: CustomText(
            text: "Send code again : 00:30",
            style: TextStyleManager.textStyle16w400,
            color: ColorsManager.blackWithOpacity,
          ),
        ),
      ),
    );
  }
}

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      followingPinTheme: PinTheme(
        width: context.deviceWidth * 0.15,
        height: context.deviceWidth * 0.15,
        textStyle: TextStyleManager.textStyle32w500
            .copyWith(color: ColorsManager.green),
        decoration: BoxDecoration(
          //color: ColorsManager.yellowClr,
          borderRadius: BorderRadius.circular(15),

          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.gray,
              width: 0.5,
            ),
            left: BorderSide(
              color: ColorsManager.gray,
              width: 0.5,
            ),
            right: BorderSide(
              color: ColorsManager.gray,
              width: 0.5,
            ),
            top: BorderSide(
              color: ColorsManager.gray,
              width: 0.5,
            ),
          ),
        ),
      ),
      defaultPinTheme: PinTheme(
        width: context.deviceWidth * 0.15,
        height: context.deviceWidth * 0.15,
        textStyle: TextStyleManager.textStyle32w500
            .copyWith(color: ColorsManager.green),
        decoration: BoxDecoration(
          // color: ColorsManager.green,

          borderRadius: BorderRadius.circular(15),
          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.gray,
              width: 0.5,
            ),
            left: BorderSide(
              color: ColorsManager.gray,
              width: 0.5,
            ),
            right: BorderSide(
              color: ColorsManager.gray,
              width: 0.5,
            ),
            top: BorderSide(
              color: ColorsManager.gray,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
