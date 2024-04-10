import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_reminder/controller/notification_cubit/notification_cubit.dart';
import 'package:pill_reminder/core/theme/manager/colors_manager.dart';
import 'package:pill_reminder/core/theme/manager/text_style_manager.dart';

import '../notifications_widget/notifications_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (NotificationCubit.get(context).page <=
            NotificationCubit.get(context).notificationModel!.meta!.lastPage!) {
          NotificationCubit.get(context).getNotification();
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NotificationCubit.get(context).page = 1;
    return BlocProvider.value(
      value: NotificationCubit.get(context)..getNotification(),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
          if (state is NotificationActionLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NotificationOneDeleteSuccessState) {
            NotificationCubit.get(context).getNotification();
            if (NotificationCubit.get(context).count != 0) {
              NotificationCubit.get(context).count--;
            }
            NotificationCubit.get(context).emit(
                GetNotificationCountSuccessState(
                    NotificationCubit.get(context).count));
            NotificationCubit.get(context).emit(NotificationSuccessState(
                NotificationCubit.get(context).notificationModel!));
          } else if (state is NotificationAllDeleteSuccessState) {
            NotificationCubit.get(context).notificationModel!.data!.clear();
            NotificationCubit.get(context).count = 0;
            NotificationCubit.get(context).emit(
                GetNotificationCountSuccessState(
                    NotificationCubit.get(context).count));
            NotificationCubit.get(context).emit(NotificationSuccessState(
                NotificationCubit.get(context).notificationModel!));
          } else if (state is NotificationAllSeenSuccessState) {
            for (var element
                in NotificationCubit.get(context).notificationModel!.data!) {
              element.seen = true;
            }
            NotificationCubit.get(context).count = 0;
            NotificationCubit.get(context).emit(
                GetNotificationCountSuccessState(
                    NotificationCubit.get(context).count));
            NotificationCubit.get(context).emit(NotificationSuccessState(
                NotificationCubit.get(context).notificationModel!));
          } else if (state is NotificationSeenOneSuccessState) {
            NotificationCubit.get(context)
                .notificationModel!
                .data![state.index]
                .seen = true;
            NotificationCubit.get(context).count--;
            NotificationCubit.get(context).emit(
                GetNotificationCountSuccessState(
                    NotificationCubit.get(context).count));
            NotificationCubit.get(context).emit(NotificationSuccessState(
                NotificationCubit.get(context).notificationModel!));
          } else if (state is NotificationActionError) {
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Notifications"),
            ),

            // backgroundColor: ColorManager.colorScaffold,
            body: SafeArea(
              child: Column(
                children: [
                  // AppBarWidget(
                  //   text: TextManager.NOTIFICATIONS.tr,
                  //   height: 124,
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      NotificationCubit.get(context).seenAllNotification();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsManager.green,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Make All Read",
                          style: TextStyleManager.textStyle18w600
                              .copyWith(color: ColorsManager.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                   
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
