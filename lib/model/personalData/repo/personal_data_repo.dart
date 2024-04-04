import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pill_reminder/core/error/failure.dart';
import 'package:pill_reminder/core/helper/keys.dart';
import 'package:pill_reminder/core/networking/dio_helpers.dart';
import 'package:pill_reminder/core/networking/pill_reminder_end_point.dart';
import 'package:pill_reminder/core/services/cache_service.dart';
import 'package:pill_reminder/model/personalData/personal_data.dart';

abstract class PersonalDataRepo {
  Future<Either<Failures, PersonalDataModel>> getPersonalData();
  Future<Either<Failures, PersonalDataModel>> editPersonalData(
      {required String name, required String email, required File empFace});
}

class PersonalDataRepoImpl extends PersonalDataRepo {
  @override
  Future<Either<Failures, PersonalDataModel>> getPersonalData() async {
    try {
      final response = await DioHelper.getData(
          url: PillReminderEndPoint.getProfile,
          token: CacheService.getDataString(key: Keys.token));
      return Right(PersonalDataModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, PersonalDataModel>> editPersonalData(
      {required String name,
      required String email,
      required File empFace}) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "email": email,
        "file": await MultipartFile.fromFile(
          empFace.path,
          filename: "fileName${Random().nextInt(99999999)}",
        ),
      });
      final response = await DioHelper.postData(
          url: PillReminderEndPoint.updateProfile,
          token: CacheService.getDataString(key: Keys.token),
          data: formData);
      return Right(PersonalDataModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
