import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:pill_reminder/controller/add_medicien/add_medicien_cubit.dart';
import 'package:pill_reminder/controller/medicines/medicines_cubit.dart';
import 'package:pill_reminder/core/helper/enums.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_snak_bar.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/pill_icon.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/amount_and_how_long.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/custom_text_field.dart';

class EditPillScreen extends StatefulWidget {
  Medicines medicines;

  EditPillScreen({super.key, required this.medicines});

  @override
  State<EditPillScreen> createState() => _EditPillScreenState();
}

class _EditPillScreenState extends State<EditPillScreen> {
  Medicines? medicines;

  @override
  void initState() {
    super.initState();
    DateTime dd = DateTime.parse(widget.medicines.startTime!.substring(0, 16));
    medicines = Medicines(
      name: widget.medicines.name,
      dosage: widget.medicines.dosage,
      startTime: DateFormat('yyyy-MM-dd HH:mm').format(dd),
      id: widget.medicines.id,
      beforeEating: widget.medicines.beforeEating,
      count: widget.medicines.count,
      frequency: widget.medicines.frequency,
      image: widget.medicines.image,
      nextTakeTime: widget.medicines.nextTakeTime,
      shouldReminder: widget.medicines.shouldReminder,
      takenCount: widget.medicines.takenCount,
      type: widget.medicines.type,
      snoozeTill: widget.medicines.snoozeTill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Edit pills",
          style: TextStyleManager.textStyle15w500,
        ),
        backgroundColor: ColorsManager.white,
        leading: InkWell(
          onTap: () {
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (Route<dynamic> route) => false,
            );
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorsManager.gray,
          ),
        ),
      ),
      body: BlocListener<MedicinesCubit, MedicinesState>(
        listener: (context, state) {
          if (state is MedicinesEditSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                  text: state.message, colorState: ColorState.sucess),
            );
            widget.medicines = medicines!;
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (route) => false,
            );
          }
          if (state is MedicinesError) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                text: state.errorMessage, colorState: ColorState.failure));
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.r),
          width: context.deviceWidth,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFeild(
                  title: "Pills name",
                  enabled: true,
                  initialValue: widget.medicines.name,
                  hintText: "Enter pills name",
                  prefixIcon: const PillIcon(),
                  onChanged: (p0) {
                    medicines!.name = p0;
                  },
                ),
                SizedBox(height: 20.h),
                AmountAndHowLong(medicines: medicines!),
                SizedBox(height: 20.h),
                Column(
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
                                onTap: () {
                                  setState(() {
                                    showOmniDateTimePicker(context: context)
                                        .then((value) {
                                      medicines!.startTime =
                                          DateFormat('yyyy-MM-dd HH:mm')
                                              .format(value!);
                                      AddMedicienCubit.get(context).date =
                                          value;
                                      AddMedicienCubit.get(context)
                                          .addController();
                                    });
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
                                          FittedBox(
                                            child: CustomText(
                                              text: medicines!.startTime!
                                                  .split(" ")[0],
                                              style: TextStyleManager
                                                  .textStyle15w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.r,
                                          ),
                                          FittedBox(
                                            child: CustomText(
                                              text: medicines!.startTime!
                                                  .split(" ")[1],
                                              style: TextStyleManager
                                                  .textStyle15w500,
                                            ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FittedBox(
                                        child: CustomText(
                                            text: "should reminder",
                                            style: TextStyleManager
                                                .textStyle14w400,
                                            color: ColorsManager.black),
                                      ),
                                      Switch(
                                        value: widget.medicines.shouldReminder!,
                                        onChanged: (value) {
                                          widget.medicines.shouldReminder =
                                              value;
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FittedBox(
                                        child: CustomText(
                                            text: "before eating",
                                            style: TextStyleManager
                                                .textStyle14w400,
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
                ),
                SizedBox(height: 20.h),
                CustomText(
                  text: "dosage",
                  style: TextStyleManager.textStyle15w400,
                  color: ColorsManager.black,
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: TextFormField(
                    maxLines: null,
                    initialValue: medicines!.dosage,
                    minLines: 2,
                    onChanged: (value) {
                      medicines!.dosage = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter dosage",
                      fillColor: ColorsManager.lightGray,
                      filled: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
        onPressed: () {
          MedicinesCubit.get(context).editMedicines(medicines: medicines!);
        },
        child: CustomText(
          text: "Done",
          style: TextStyleManager.textStyle18w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
