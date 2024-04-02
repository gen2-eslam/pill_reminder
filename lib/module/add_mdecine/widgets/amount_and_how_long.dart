
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class AmountAndHowLong extends StatelessWidget {
  const AmountAndHowLong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        CustomText(
          text: "Amount & How long?",
          style: TextStyleManager.textStyle15w400,
          color: ColorsManager.black,
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 20.r),
              decoration: BoxDecoration(
                color: ColorsManager.lightGray,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.medical_information_sharp,
                      color: ColorsManager.gray),
                  SizedBox(width: 10.w),
                  DropdownButton(
                    icon: Row(children: [
                      CustomText(
                          text: "pills",
                          style: TextStyleManager.textStyle12w400),
                      const Icon(Icons.arrow_drop_down)
                    ]),
                    hint: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.r),
                        child: CustomText(
                          text: "1",
                          style: TextStyleManager.textStyle15w500,
                        )),
                    underline: Container(),
                    onChanged: (value) {},
                    items: const [
                      DropdownMenuItem(
                        value: "1",
                        child: Text("1"),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("2"),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text("3"),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text("4"),
                      ),
                      DropdownMenuItem(
                        value: "5",
                        child: Text("5"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 20.r),
              decoration: BoxDecoration(
                color: ColorsManager.lightGray,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.calendar_today_rounded,
                      color: ColorsManager.gray),
                  SizedBox(width: 10.w),
                  DropdownButton(
                    icon: Row(children: [
                      CustomText(
                          text: "days",
                          style: TextStyleManager.textStyle12w400),
                      const Icon(Icons.arrow_drop_down)
                    ]),
                    hint: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.r),
                        child: CustomText(
                          text: "1",
                          style: TextStyleManager.textStyle15w500,
                        )),
                    underline: Container(),
                    onChanged: (value) {},
                    items: const [
                      DropdownMenuItem(
                        value: "1",
                        child: Text("1"),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("2"),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text("3"),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text("4"),
                      ),
                      DropdownMenuItem(
                        value: "5",
                        child: Text("5"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
