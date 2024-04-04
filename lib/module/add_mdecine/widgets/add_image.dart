import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class AddImage extends StatelessWidget {
  final String? image;
  const AddImage({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      height: 100.h,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorsManager.lightGray,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: image == null
          ? CustomText(text: "Image", style: TextStyleManager.textStyle15w500)
          : Image.network(image!),
    );
  }
}
