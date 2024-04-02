
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  const CustomSearchBar({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorsManager.darkblue,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.lightGray,
        hintText: "Search",
        alignLabelWithHint: true,
        prefixIcon: const Icon(
          Icons.search,
          color: ColorsManager.gray,
        ),
        border: border(context),
        enabledBorder: border(context),
        focusedBorder: border(context),
        errorBorder: border(context),
        focusedErrorBorder: border(context),
      ),
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
