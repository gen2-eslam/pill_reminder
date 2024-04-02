import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/routes/routes.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/utils/images_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';
import 'package:pill_reminder/core/widgets/pill_icon.dart';
import 'package:pill_reminder/module/home/widgets/custom_search_bar.dart';
import 'package:pill_reminder/module/medecine/medecine_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: context.deviceWidth,
          padding: EdgeInsets.all(25.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchBar(),
              SizedBox(
                height: 20.h,
              ),
              RichText(
                text: TextSpan(
                  text: "Hello,\n",
                  style: TextStyleManager.textStyle28w600.copyWith(
                    color: ColorsManager.blackWithOpacity,
                  ),
                  children: [
                    TextSpan(
                      text: "Kathryn",
                      style: TextStyleManager.textStyle28w400.copyWith(
                        color: ColorsManager.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                text: "Daily Review",
                style: TextStyleManager.textStyle17w500,
                color: ColorsManager.black,
              ),
              SizedBox(
                height: 20.h,
              ),
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
                        onTap: () {
                          context.pushNamed(Routes.medecineScreen);
                        },
                        leading: const PillIcon(),
                        title: CustomText(
                          textAlign: TextAlign.start,
                          text: "Oxycodone",
                          style: TextStyleManager.textStyle15w500,
                          color: ColorsManager.black,
                        ),
                        subtitle: CustomText(
                          textAlign: TextAlign.start,
                          text: "10:00 AM . Completed",
                          style: TextStyleManager.textStyle13w500,
                          color: ColorsManager.gray,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 10.r,
                      color: Colors.transparent,
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: context.deviceHeight * 0.05.r,
          right: context.deviceWidth * 0.05.r,
        ),
        child: FloatingActionButton(
          onPressed: () {
            context.pushNamed(Routes.addMedecineScreen);
          },
          backgroundColor: ColorsManager.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              18.r,
            ),
          ),
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
