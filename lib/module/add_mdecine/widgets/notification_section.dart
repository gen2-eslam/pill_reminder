import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20.h),
        CustomText(
            text: "Notification",
            style: TextStyleManager.textStyle15w400,
            color: ColorsManager.black),
        SizedBox(height: 20.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: "start medicine",
                style: TextStyleManager.textStyle15w400,
                color: ColorsManager.black),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 20.r),
              decoration: BoxDecoration(
                color: ColorsManager.lightGray,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: InkWell(
                onTap: () async {
                  //todo add time and date
                  await showOmniDateTimePicker(context: context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.notifications, color: ColorsManager.gray),
                    SizedBox(width: 10.w),
                    FittedBox(
                      child: CustomText(
                        text: "10:00 AM",
                        style: TextStyleManager.textStyle15w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4.r, horizontal: 5.r),
            decoration: BoxDecoration(
              color: ColorsManager.lightGray,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // const Icon(Icons.calendar_today_rounded,
                //     color: ColorsManager.gray),
                CustomText(
                    text: "every", style: TextStyleManager.textStyle17w500),
                SizedBox(width: 10.w),
                DropdownButton(
                  icon: Row(children: [
                    CustomText(
                        text: "hours", style: TextStyleManager.textStyle17w500),
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
        ),
      ],
    );
  }
}
