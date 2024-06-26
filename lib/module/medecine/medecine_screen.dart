import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/home/home_cubit.dart';
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
import 'package:pill_reminder/module/add_mdecine/widgets/add_image.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/custom_text_field.dart';
import 'package:pill_reminder/module/medecine/widgets/title_and_value.dart';

class MedecineScreen extends StatelessWidget {
  const MedecineScreen({super.key, required this.medicines});
  final Medicines medicines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Mdecine",
          style: TextStyleManager.textStyle15w500,
        ),
        backgroundColor: ColorsManager.white,
        actions: [
          IconButton(
            onPressed: () {
              print(medicines.toString());
              context.pushNamed(Routes.editPillScreen, arguments: medicines);
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.green,
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorsManager.gray,
          ),
        ),
      ),
      body: BlocListener<MedicinesCubit, MedicinesState>(
        listener: (context, state) {
          if (state is MedicinesTakeSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                text: state.message, colorState: ColorState.sucess));
            HomeCubit.get(context).getMedicines();
          }
          //MedicinesError
          if (state is MedicinesTakeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                text: state.errorMessage,
                colorState: ColorState.failure,
              ),
            );
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
                SizedBox(
                  width: double.infinity,
                  height: 100.r,
                  child: Image.network(
                    medicines.image!,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFeild(
                  title: "Pills name",
                  enabled: false,
                  hintText: medicines.name,
                  prefixIcon: const PillIcon(),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFeild(
                        title: "Types of medicines",
                        enabled: false,
                        hintText: medicines.type,
                        prefixIcon: const PillIcon(),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: CustomTextFeild(
                        title: "count",
                        enabled: false,
                        hintText: medicines.count.toString(),
                        prefixIcon: const PillIcon(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFeild(
                        title: "taken count",
                        enabled: false,
                        hintText: medicines.takenCount.toString(),
                        prefixIcon: const PillIcon(),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: CustomTextFeild(
                        title: "frequency",
                        enabled: false,
                        hintText: medicines.frequency,
                        prefixIcon: const PillIcon(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFeild(
                        title: "before or after eating",
                        enabled: false,
                        hintText: medicines.beforeEating! ? "before" : "after",
                        prefixIcon: const PillIcon(),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: CustomTextFeild(
                        title: "should reminder",
                        enabled: false,
                        hintText: medicines.shouldReminder! ? "yes" : "no",
                        prefixIcon: const PillIcon(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                TitleWithValue(
                  title: "dosage",
                  value: medicines.dosage!,
                ),
                SizedBox(height: 20.h),
                TitleWithValue(
                  title: "start Time Take",
                  value: medicines.startTime!,
                ),
                TitleWithValue(
                  title: "Last Time Take",
                  value: medicines.nextTakeTime!,
                ),

                SizedBox(height: 20.h),
                // CustomText(
                //   text: " History",
                //   style: TextStyleManager.textStyle15w500,
                // ),
                // SizedBox(height: 20.h),
                // Container(
                //   decoration: const BoxDecoration(
                //     color: ColorsManager.lightGray,
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(24),
                //     ),
                //   ),
                //   child: ListTile(
                //     shape: const RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(24),
                //       ),
                //     ),
                //     onTap: () {
                //       context.pushNamed(Routes.historyScreen);
                //     },
                //     leading: Image.asset(ImagesManager.pill, height: 50.r),
                //     title: CustomText(
                //       textAlign: TextAlign.start,
                //       text: "Oxycodone",
                //       style: TextStyleManager.textStyle15w500,
                //       color: ColorsManager.black,
                //     ),
                //     subtitle: CustomText(
                //       textAlign: TextAlign.start,
                //       text: "10:00 AM ",
                //       style: TextStyleManager.textStyle13w500,
                //       color: ColorsManager.gray,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(5.r),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                context.pushNamed(Routes.historyScreen, arguments: medicines);
              },
              icon: Icon(
                Icons.history,
                size: 30.r,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: CustomElevatedButton(
                onPressed: () {
                  print(medicines.toString());
                  MedicinesCubit.get(context).takeMedicines(id: medicines.id!);
                },
                child: CustomText(
                  text: "Take",
                  style: TextStyleManager.textStyle18w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
