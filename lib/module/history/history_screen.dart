import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/utils/images_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "History",
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
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(25.r),
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
                onTap: () {
                  context.pushNamed(Routes.detailsHistoryScreen);
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
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.h);
          },
          itemCount: 20),
    );
  }
}
