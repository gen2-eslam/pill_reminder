import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:pill_reminder/controller/add_medicien/add_medicien_cubit.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';

class NotificationSection extends StatefulWidget {
  final Medicines medicines;
  const NotificationSection({
    super.key,
    required this.medicines,
  });

  @override
  State<NotificationSection> createState() => _NotificationSectionState();
}

class _NotificationSectionState extends State<NotificationSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IntrinsicWidth(
              stepHeight: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.notifications,
                          color: ColorsManager.gray),
                      CustomText(
                          textAlign: TextAlign.start,
                          text: "start medicine",
                          style: TextStyleManager.textStyle15w400,
                          color: ColorsManager.black),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      await showOmniDateTimePicker(context: context)
                          .then((value) {
                        print(value);
                        widget.medicines.startTime =
                            DateFormat('yyyy-MM-dd').add_Hm().format(value!);
                        AddMedicienCubit.get(context).date = value;
                        AddMedicienCubit.get(context).addController();
                        print(widget.medicines.startTime);
                        setState(() {});
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.r, horizontal: 10.r),
                      decoration: BoxDecoration(
                        color: ColorsManager.lightGray,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text:
                                    widget.medicines.startTime!.split(" ")[0],
                                style: TextStyleManager.textStyle15w500,
                              ),
                              SizedBox(
                                height: 20.r,
                              ),
                              CustomText(
                                text: DateFormat.jm().format(
                                    AddMedicienCubit.get(context).date!),
                                style: TextStyleManager.textStyle15w500,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            SizedBox(width: 10.r),
            Expanded(
              child: IntrinsicWidth(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: ColorsManager.lightGray,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: CustomText(
                                text: "should reminder",
                                style: TextStyleManager.textStyle14w400,
                                color: ColorsManager.black),
                          ),
                          Switch(
                            value: widget.medicines.shouldReminder!,
                            onChanged: (value) {
                              widget.medicines.shouldReminder = value;
                              setState(() {});
                            },
                            activeColor: ColorsManager.green,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: ColorsManager.lightGray,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: CustomText(
                                text: "before eating",
                                style: TextStyleManager.textStyle14w400,
                                color: ColorsManager.black),
                          ),
                          Switch(
                            value: widget.medicines.beforeEating!,
                            onChanged: (value) {
                              widget.medicines.beforeEating = value;
                              setState(() {});
                            },
                            activeColor: ColorsManager.green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
