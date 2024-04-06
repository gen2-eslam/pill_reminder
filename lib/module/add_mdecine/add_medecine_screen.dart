import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/edit_medicien/medicien_cubit.dart';
import 'package:pill_reminder/core/helper/enums.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_snak_bar.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/pill_icon.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/add_image.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/amount_and_how_long.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/custom_text_field.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/notification_section.dart';

class AddMedecineScreen extends StatelessWidget {
  const AddMedecineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
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
      body: BlocListener<EditMedicienCubit, EditMedicienState>(
        listener: (context, state) {
          if (state is MedicienAddSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                text: state.message, colorState: ColorState.sucess));
            context.pop();
          } else if (state is MedicienError) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                text: state.error, colorState: ColorState.failure));
          }
        },
        child: Container(
          padding: EdgeInsets.all(25.r),
          width: context.deviceWidth,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    BlocBuilder<EditMedicienCubit, EditMedicienState>(
                      builder: (context, state) {
                        return AddImage(
                          image: EditMedicienCubit.get(context).image,
                        );
                      },
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: ColorsManager.green,
                          ),
                          onPressed: () {
                            EditMedicienCubit.get(context).getImage();
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextFeild(
                  title: "Pills name",
                  enabled: true,
                  controller: EditMedicienCubit.get(context).pillNameController,
                  hintText: "Enter pills name",
                  prefixIcon: const PillIcon(),
                ),
                AmountAndHowLong(
                  medicines: EditMedicienCubit.get(context).medicines,
                ),
                NotificationSection(
                  medicines: EditMedicienCubit.get(context).medicines,
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
                  child: TextField(
                    maxLines: null,
                    controller:
                        EditMedicienCubit.get(context).dosageNameController,
                    minLines: 2,
                    decoration: const InputDecoration(
                      hintText: "Enter dosage",
                      fillColor: ColorsManager.lightGray,
                      filled: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomElevatedButton(
        onPressed: () {
          EditMedicienCubit.get(context).addMedecin();
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
