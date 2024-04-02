import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/utils/space_Manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const CustomElevatedButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppPadding.p10)),
            minimumSize: Size(double.infinity, 50.r),
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: AppPadding.p48, vertical: AppPadding.p12),
            backgroundColor: context.theme.primaryColor),
        child: child);
  }
}
