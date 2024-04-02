import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/utils/images_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/pill_icon.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/add_image.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/custom_text_field.dart';
import 'package:pill_reminder/module/add_mdecine/widgets/notification_section.dart';

class DetailsHistoryScreen extends StatelessWidget {
  const DetailsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Details",
          style: TextStyleManager.textStyle15w500,
        ),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const AddImage(),
          SizedBox(height: 20.h),
          const CustomTextFeild(
            title: "Pills name",
            enabled: true,
            hintText: "Enter pills name",
            prefixIcon: PillIcon(),
          ),
          const NotificationSection(),
          CustomText(
            text: " History",
            style: TextStyleManager.textStyle15w500,
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
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
                      onTap: () {},
                      leading: Image.asset(ImagesManager.pill, height: 50.r),
                      title: CustomText(
                        textAlign: TextAlign.start,
                        text: "Oxycodone",
                        style: TextStyleManager.textStyle15w500,
                        color: ColorsManager.black,
                      ),
                      subtitle: CustomText(
                        textAlign: TextAlign.start,
                        text: "10:00 AM - Before Eating",
                        style: TextStyleManager.textStyle13w500,
                        color: ColorsManager.gray,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: 10),
          )
        ]),
      ),
    );
  }
}
