import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextStyle? texytStyle;
  final String? Function(String?)? validator;
  const CustomTextFormFeild({
    super.key,
    required this.title,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    required this.hintText,
    this.texytStyle,
  });
  OutlineInputBorder border(BuildContext context) => OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.gray,
          width: 0.5,
        ),
        // gapPadding: AppPadding.p24,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          style: TextStyleManager.textStyle15w400,
          color: ColorsManager.green,
        ),
        SizedBox(
          height: 5.r,
        ),
        TextFormField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          cursorColor: ColorsManager.darkblue,
          style: texytStyle,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            alignLabelWithHint: true,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: ColorsManager.gray,
                  )
                : null,
            suffixIcon: suffixIcon,
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
}
