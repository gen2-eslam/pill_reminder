import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pill_reminder/core/error/failure.dart';
import 'package:pill_reminder/core/helper/keys.dart';
import 'package:pill_reminder/core/networking/dio_helpers.dart';
import 'package:pill_reminder/core/networking/pill_reminder_end_point.dart';
import 'package:pill_reminder/core/services/cache_service.dart';
import 'package:pill_reminder/model/logs/logs_model.dart';
import 'package:pill_reminder/model/medicines/medicines_model.dart';
import 'package:pill_reminder/model/register/register_response.dart';

abstract class MedicinesRepo {
  Future<Either<Failures, MedicinesModel>> getMedicines();

  Future<Either<Failures, Medicines>> getOneMedicine({required int id});

  Future<Either<Failures, AuthResponse>> addMedicines(
      {required Medicines medicines, required File image});

  Future<Either<Failures, AuthResponse>> editMedicines(
      {required int id, required Medicines medicines});
  Future<Either<Failures, AuthResponse>> takeMedicines({
    required int id,
  });
  Future<Either<Failures, List<LogsData>>> getLogs({required int id});
}

class MedicinesRepoImpl implements MedicinesRepo {
  @override
  Future<Either<Failures, MedicinesModel>> getMedicines() async {
    try {
      final response = await DioHelper.getData(
        url: PillReminderEndPoint.getMedicines,
        token: CacheService.getDataString(key: Keys.token),
      );
      return Right(MedicinesModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AuthResponse>> editMedicines({
    required int id,
    required Medicines medicines,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: PillReminderEndPoint.updateMedicine('$id'),
        token: CacheService.getDataString(key: Keys.token),
        data: medicines.toJson(),
      );
      return Right(AuthResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AuthResponse>> takeMedicines(
      {required int id}) async {
    try {
      final response = await DioHelper.postData(
        url: PillReminderEndPoint.takeMedicine('$id'),
        token: CacheService.getDataString(key: Keys.token),
        data: {},
      );
      return Right(AuthResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AuthResponse>> addMedicines(
      {required Medicines medicines, required File image}) async {
    try {
      FormData data = FormData.fromMap(medicines.toJson());
      data.files.add(MapEntry('image', MultipartFile.fromFileSync(image.path)));

      final response = await DioHelper.postData(
        url: PillReminderEndPoint.storeMedicine,
        token: CacheService.getDataString(key: Keys.token),
        data: data,
      );
      return Right(AuthResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<LogsData>>> getLogs({required int id}) async {
    try {
      final response = await DioHelper.getData(
        url: PillReminderEndPoint.getMedicinesLogs('$id'),
        token: CacheService.getDataString(key: Keys.token),
      );
      return Right(LogsModel.fromJson(response.data).date);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, Medicines>> getOneMedicine({required int id}) async {
    try {
      final response = await DioHelper.getData(
        url: PillReminderEndPoint.getOneMedicine('$id'),
        token: CacheService.getDataString(
          key: Keys.token,
        ),
      );
      return Right(
        Medicines.fromJson(
          response.data['data'],
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(
        LocalFailures(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
