import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final bool enabled;
  final Widget? prefixIcon;
  final String title;

  const CustomTextFeild({
    super.key,
    this.controller,
    this.initialValue,
    required this.title,
    required this.enabled,
    this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          style: TextStyleManager.textStyle15w400,
          color: ColorsManager.black,
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          style: TextStyleManager.textStyle15w400.copyWith(
            color: ColorsManager.black,
          ),
          decoration: InputDecoration(
            enabled: enabled,
            hintText: hintText,
            hintStyle: TextStyleManager.textStyle15w400.copyWith(
              color: ColorsManager.black,
            ),
            filled: true,
            fillColor: ColorsManager.lightGray,
            alignLabelWithHint: true,
            prefixIcon: prefixIcon,
            disabledBorder: border(context),
            border: border(context),
            enabledBorder: border(context),
            focusedBorder: border(context),
            errorBorder: border(context),
            focusedErrorBorder: border(context),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder border(BuildContext context) => OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0.5,
        ),
        // gapPadding: AppPadding.p24,
        borderRadius: BorderRadius.circular(
          14.r,
        ),
      );
}
