import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class SucessResetPasswordScreen extends StatelessWidget {
  const SucessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25.r),
        width: context.deviceWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "Password changed",
              style: TextStyleManager.textStyle30w700,
              color: ColorsManager.green,
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: "Your password has been changed\n succesfully",
              style: TextStyleManager.textStyle16w400,
              color: ColorsManager.gray,
            ),
            SizedBox(height: 20.h),
            CustomElevatedButton(
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.loginScreen,
                    predicate: (Route<dynamic> route) => false);
              },
              child: CustomText(
                text: "back to login",
                style: TextStyleManager.textStyle18w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
