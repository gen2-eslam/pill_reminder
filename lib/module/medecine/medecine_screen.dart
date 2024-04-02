import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/utils/images_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/pill_icon.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/add_image.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/custom_text_field.dart';
import 'package:pill_reminder/module/medecine/widgets/title_and_value.dart';

class MedecineScreen extends StatelessWidget {
  const MedecineScreen({super.key});

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
              context.pushNamed(Routes.editPillScreen);
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.r),
        width: context.deviceWidth,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddImage(),
              SizedBox(height: 20.h),
              const CustomTextFeild(
                title: "Pills name",
                enabled: true,
                hintText: "Enter pills name",
                prefixIcon: PillIcon(),
              ),
              SizedBox(height: 20.h),
              const TitleWithValue(
                title: "Amount take",
                value: "30",
              ),
              SizedBox(height: 20.h),
              const TitleWithValue(
                title: "Remaining medication",
                value: "sdada",
              ),
              SizedBox(height: 20.h),
              const TitleWithValue(
                title: "Last Time Take",
                value: "12/2/2024 10:00 pm",
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: " History",
                style: TextStyleManager.textStyle15w500,
              ),
              SizedBox(height: 20.h),
              Container(
                decoration: const BoxDecoration(
                  color: ColorsManager.lightGray,
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  onTap: () {
                    context.pushNamed(Routes.historyScreen);
                  },
                  leading: Image.asset(ImagesManager.pill, height: 50.r),
                  title: CustomText(
                    textAlign: TextAlign.start,
                    text: "Oxycodone",
                    style: TextStyleManager.textStyle15w500,
                    color: ColorsManager.black,
                  ),
                  subtitle: CustomText(
                    textAlign: TextAlign.start,
                    text: "10:00 AM ",
                    style: TextStyleManager.textStyle13w500,
                    color: ColorsManager.gray,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                onPressed: () {
                  // context.pushNamed(Routes.homeScreen);
                },
                child: CustomText(
                  text: "Take",
                  style: TextStyleManager.textStyle18w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
