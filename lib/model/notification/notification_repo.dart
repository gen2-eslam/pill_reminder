import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pill_reminder/core/error/failure.dart';
import 'package:pill_reminder/core/helper/keys.dart';
import 'package:pill_reminder/core/networking/dio_helpers.dart';
import 'package:pill_reminder/core/networking/pill_reminder_end_point.dart';
import 'package:pill_reminder/core/services/cache_service.dart';
import 'package:pill_reminder/model/notification/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failures, NotificationModel>> getNotifications(int page);
  Future<Either<Failures, bool>> seenAllNotification();
  Future<Either<Failures, int>> getNotificationCount();
  Future<Either<Failures, bool>> seenOneNotification(String id);
  Future<Either<Failures, bool>> deleteOneNotification(String id);
  Future<Either<Failures, bool>> deleteAllNotification();
}

class NotificationRepoImpl extends NotificationRepo {
  @override
  Future<Either<Failures, NotificationModel>> getNotifications(int page) async {
    try {
      Response response = await DioHelper.getData(
          url: PillReminderEndPoint.getNotifications,
          token: CacheService.getDataString(key: Keys.token),
          queryParameters: {'page': page});
      print(NotificationModel.fromJson(response.data));
      return Right(NotificationModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> seenAllNotification() async {
    try {
      Response response = await DioHelper.patchData(
          token: CacheService.getDataString(key: Keys.token),
          url: PillReminderEndPoint.markAllNotificationsAsRead,
          data: {});
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> seenOneNotification(String id) async {
    try {
      Response response = await DioHelper.patchData(
        url: PillReminderEndPoint.markOneNotificationAsRead(id),
        token: CacheService.getDataString(key: Keys.token),
        data: {},
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> deleteAllNotification() async {
    try {
      Response response = await DioHelper.deleteData(
        token: CacheService.getDataString(key: Keys.token),
        url: PillReminderEndPoint.deleteNotification,
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> deleteOneNotification(String id) async {
    try {
      Response response = await DioHelper.deleteData(
        token: CacheService.getDataString(key: Keys.token),
        url: PillReminderEndPoint.deleteOneNotificationAsRead(id),
        data: {},
      );
      return const Right(true);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, int>> getNotificationCount() async {
    try {
      Response response = await DioHelper.getData(
        token: CacheService.getDataString(key: Keys.token),
        url: PillReminderEndPoint.getUnreadNotificationsCount,
      );
      return Right(response.data['data']['unreadNotificationsCount']);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
