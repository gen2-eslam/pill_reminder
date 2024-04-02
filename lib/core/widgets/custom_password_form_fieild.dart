import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class CustomPasswordFormFeild extends StatefulWidget {
  final String title;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextStyle? texytStyle;
  final String? Function(String?)? validator;
  const CustomPasswordFormFeild({
    super.key,
    required this.title,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.controller,
    required this.hintText,
    this.texytStyle,
  });

  @override
  State<CustomPasswordFormFeild> createState() =>
      _CustomPasswordFormFeildState();
}

class _CustomPasswordFormFeildState extends State<CustomPasswordFormFeild> {
  bool obscureText = true;
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
          text: widget.title,
          style: TextStyleManager.textStyle15w400,
          color: ColorsManager.green,
        ),
        SizedBox(
          height: 5.r,
        ),
        TextFormField(
          obscureText: obscureText,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          cursorColor: ColorsManager.darkblue,
          style: widget.texytStyle,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            alignLabelWithHint: true,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: ColorsManager.gray,
                  )
                : null,
            suffixIcon: IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: ColorsManager.gray,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                }),
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
