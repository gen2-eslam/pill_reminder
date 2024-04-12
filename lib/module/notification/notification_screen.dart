import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/notification_cubit/notification_cubit.dart';
import 'package:pill_reminder/core/helper/extensions.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';
import 'package:pill_reminder/core/widgets/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Notification",
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
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationSuccessState) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(25.r),
              itemBuilder: (context, index) {
                return ListTile(
                  title: CustomText(
                    text: state.notificationModel.data[index].title,
                    textAlign: TextAlign.start,
                    style: TextStyleManager.textStyle15w500,
                  ),
                  subtitle: CustomText(
                    text: state.notificationModel.data[index].body,
                    textAlign: TextAlign.start,
                    style: TextStyleManager.textStyle13w500,
                    color: ColorsManager.blackWithOpacity,
                  ),
                  leading: const Icon(
                    Icons.notifications,
                    color: ColorsManager.green,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
              itemCount: state.notificationModel.data.length,
            );
          } else if (state is NotificationErrorState) {
            return Center(
                child: CustomText(
              text: state.error,
              style: TextStyleManager.textStyle15w500,
            ));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
