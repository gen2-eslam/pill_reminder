import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';


class CustomLocationSearch extends StatelessWidget {
  const CustomLocationSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: InkWell(
        onTap: () {
          // context.push(PageName.kSearchView);
        },
        borderRadius: BorderRadius.circular(16.r),
        child: AnimatedContainer(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minHeight: context.deviceHeight * 0.05,
          ),
          alignment: Alignment.center,
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.theme.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
          width: context.deviceWidth * 0.5,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: context.deviceWidth * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "search",
                  style: TextStyleManager.textStyle15w400,
                ),
                const Icon(Icons.search),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
