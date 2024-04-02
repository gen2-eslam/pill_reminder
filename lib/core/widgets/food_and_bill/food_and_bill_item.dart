import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/utils/images_manager.dart';

class FoodAndPillItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String image;
  const FoodAndPillItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: context.deviceWidth * 0.25,
        height: context.deviceWidth * 0.25,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? ColorsManager.green
              : ColorsManager.lightGray,
          borderRadius: BorderRadius.all(
            Radius.circular(
              14.r,
            ),
          ),
        ),
        child: Image.asset(
          image,
          color: selectedIndex == index ? ColorsManager.white : Colors.grey,
        ),
      ),
    );
  }
}
