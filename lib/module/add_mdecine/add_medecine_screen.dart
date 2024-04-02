import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_elevated_button.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/food_and_bill/food_and_bill_list.dart';
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
      resizeToAvoidBottomInset: false,
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
      body: Container(
        padding: EdgeInsets.all(25.r),
        width: context.deviceWidth,
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
            const AmountAndHowLong(),
            const NotificationSection(),
            FoodAndPillsList(),
            SizedBox(height: 20.h),
            CustomElevatedButton(
              onPressed: () {
                // context.pushNamed(Routes.homeScreen);
              },
              child: CustomText(
                text: "Done",
                style: TextStyleManager.textStyle18w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
