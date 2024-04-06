import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:pill_reminder/module/add_mdecine/widgets/notification_section.dart';

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
    medicines = Medicines(
      name: widget.medicines.name,
      dosage: widget.medicines.dosage,
      startTime: widget.medicines.startTime,
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
                NotificationSection(medicines: medicines!),
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
                  child: TextField(
                    maxLines: null,
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
