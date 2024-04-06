import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/pill_icon.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';

class AmountAndHowLong extends StatefulWidget {
  final Medicines medicines;
  const AmountAndHowLong({
    super.key,
    required this.medicines,
  });

  @override
  State<AmountAndHowLong> createState() => _AmountAndHowLongState();
}

class _AmountAndHowLongState extends State<AmountAndHowLong> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        CustomText(
          text: "Amount And Frequency",
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
                  const PillIcon(),
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
                          text: widget.medicines.count!.toString(),
                          style: TextStyleManager.textStyle15w500,
                        )),
                    underline: Container(),
                    onChanged: (value) {
                      widget.medicines.count = int.parse(value!);
                      setState(() {});
                    },
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
            SizedBox(
              width: 30.r,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 20.r),
              width: context.deviceWidth * 0.4,
              decoration: BoxDecoration(
                color: ColorsManager.lightGray,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  // const Icon(Icons.calendar_today_rounded,
                  //     color: ColorsManager.gray),
                  SizedBox(width: 10.w),
                  DropdownButton(
                    value: widget.medicines.frequency,
                    icon: const Row(children: [Icon(Icons.arrow_drop_down)]),
                    underline: Container(),
                    onChanged: (value) {
                      widget.medicines.frequency = value!;
                      setState(() {});
                    },
                    items: const [
                      DropdownMenuItem(
                        value: "daily",
                        child: Text("daily"),
                      ),
                      DropdownMenuItem(
                        value: "weekly",
                        child: Text("weekly"),
                      ),
                      DropdownMenuItem(
                        value: "monthly",
                        child: Text("monthly"),
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
