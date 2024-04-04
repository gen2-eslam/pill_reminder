import 'package:flutter/material.dart';
import 'package:pill_reminder/controller/auth/auth_cubit.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pinput/pinput.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AuthCubit.get(context).pinFormKey,
      child: Pinput(
        controller: AuthCubit.get(context).pinPutController,
        validator: (value) {
          if (value!.isEmpty) {
            return "please enter your pin";
          }
          return null;
        },
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
      ),
    );
  }
}
