import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/utils/images_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/food_and_bill/food_and_bill_item.dart';

class FoodAndPillsList extends StatelessWidget {
  FoodAndPillsList({
    super.key,
  });

  final List<String> images = [
    ImagesManager.before,
    ImagesManager.mid,
    ImagesManager.after
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: "Food & Pills",
          style: TextStyleManager.textStyle15w500,
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              3,
              (index) => FoodAndPillItem(
                index: index,
                selectedIndex: 0,
                image: images[index],
              ),
            )
          ],
        ),
      ],
    );
  }
}
