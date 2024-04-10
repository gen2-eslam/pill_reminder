import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pill_reminder/model/notification/notification_model.dart';

import 'package:pill_reminder/model/notification/notification_repo.dart';

import '../../model/notification/notification_model.dart';


part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState>
{
  NotificationCubit(this._notificationRepo) : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);
  NotificationRepo _notificationRepo;
  int page = 1;
  NotificationModel? notificationModel;
  int count = 0;
  Future<void> getNotification() async {
    if (page == 1) {
      emit(NotificationLoadingState());
    }
    final response = await _notificationRepo.getNotifications(page);
    response.fold((l) {
      emit(NotificationErrorState(l.errorMessage));
    }, (r) {
      if (page == 1) {
        notificationModel = r;
      } else {
        notificationModel!.data!.addAll(r.data!);
      }
      page++;
      emit(NotificationSuccessState(r));
    });
  }
  Future<void> getNotificationCount() async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.getNotificationCount();
    response.fold((l) {
      emit(GetNotificationCountErrorState(l.errorMessage));
    }, (r) {
      count = r;
      emit(GetNotificationCountSuccessState(count));
    });
  }


  Future<void> seenAllNotification() async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.seenAllNotification();
    response.fold((l) {
      emit(NotificationActionError(l.errorMessage));
    }, (r) {
      emit(NotificationAllSeenSuccessState());
    });
  }
  Future<void> seenOneNotification(String id , int index) async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.seenOneNotification(id);
    response.fold((l) {
      emit(NotificationActionError(l.errorMessage));
    }, (r) {
      emit(NotificationSeenOneSuccessState(index));
    });
  }
  Future<void> deleteAllNotification() async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.deleteAllNotification();
    response.fold((l) {
      emit(NotificationActionError(l.errorMessage));
    }, (r) {
      emit(NotificationAllDeleteSuccessState());
    });
  }
  Future<void> deleteOneNotification(String id , int index)
  async
  {
    emit(NotificationActionLoading());
    final response = await _notificationRepo.deleteOneNotification(id);
    response.fold((l) {
      emit(NotificationActionError(l.errorMessage));
    }, (r) {
      emit(NotificationOneDeleteSuccessState(index));
    });
  }
  void subscribe() async
  {

  }

}
