
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/utils/images_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class TitleWithValue extends StatelessWidget {
  final String title;
  final String value;
  const TitleWithValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: title,
          style: TextStyleManager.textStyle15w500,
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.all(15.r),
          constraints: BoxConstraints(minWidth: context.deviceWidth * 0.3),
          decoration: BoxDecoration(
            color: ColorsManager.lightGray,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(ImagesManager.pill),
              SizedBox(width: 10.w),
              FittedBox(
                child: CustomText(
                  text: value,
                  style: TextStyleManager.textStyle15w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
