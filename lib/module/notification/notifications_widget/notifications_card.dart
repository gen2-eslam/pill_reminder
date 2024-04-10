import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/model/notification/notification_model.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({super.key, required this.notificationModelData});

  final NotificationModelData notificationModelData;

  bool typeOfMessage() {
    return notificationModelData.body!.notificationType == "message_sent";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 5.h, right: 10.w, left: 10.w),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 120.h,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(16.sp),
          border: Border.all(
              color: !notificationModelData.seen!
                  ? ColorsManager.green
                  : ColorsManager.gray,
              width: 1),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2,
                color: ColorsManager.gray,
                offset: Offset(0, 0),
                spreadRadius: 1)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 15.w, left: 10.w),
          child: GestureDetector(
            onTap: () {
              if (typeOfMessage()) {
                // LayoutCubit.get(context).bottomTap(2);
                // Get.back();
              } else {
                // state 2 order screen .
                // Navigator.pushNamed(context, "/orders_screen");
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: const Icon(Icons.notifications,
                          color: ColorsManager.green)),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${typeOfMessage() ? "Message" : "Orders"} ",
                            style: TextStyleManager.textStyle16w600,
                          ),
                          const Spacer(),
                          Text(
                            notificationModelData.createdAt!,
                            style: TextStyleManager.textStyle16w600,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      notificationModelData.body!.message!,
                      style: TextStyleManager.textStyle16w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
