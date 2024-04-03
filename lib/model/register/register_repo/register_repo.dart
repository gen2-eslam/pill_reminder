import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pill_reminder/core/error/failure.dart';
import 'package:pill_reminder/core/networking/dio_helpers.dart';
import 'package:pill_reminder/core/networking/pill_reminder_end_point.dart';
import 'package:pill_reminder/model/personalData/personal_data.dart';
import 'package:pill_reminder/model/register/register_model.dart';
import 'package:pill_reminder/model/register/register_response.dart';
import 'package:pill_reminder/model/verifiy_user/verfiy_user.dart';

abstract class AuthRepo {
  Future<Either<Failures, AuthResponse>> register(RegisterModel registerModel);
  Future<Either<Failures, AuthResponse>> verifyUser(
      {required VerifyUser verifyUser});
  Future<Either<Failures, AuthResponse>> sendCodeAgain(
      {required VerifyUser verifyUser});
  Future<Either<Failures, PersonalDataModel>> login(
      {required String email, required String password});
}

class RegisterRepoImpl implements AuthRepo {
  @override
  Future<Either<Failures, AuthResponse>> register(
      RegisterModel registerModel) async {
    try {
      final response = await DioHelper.postData(
        url: PillReminderEndPoint.registerClient,
        data: registerModel.toJson(),
      );
      return Right(AuthResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AuthResponse>> verifyUser(
      {required VerifyUser verifyUser}) async {
    try {
      final response = await DioHelper.postData(
        url: PillReminderEndPoint.verifyUser,
        data: verifyUser.toJson(),
      );
      return Right(AuthResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AuthResponse>> sendCodeAgain(
      {required VerifyUser verifyUser}) async {
    try {
      final response = await DioHelper.postData(
        url: PillReminderEndPoint.resendCode,
        data: verifyUser.reSend(),
      );
      return Right(AuthResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, PersonalDataModel>> login(
      {required String email, required String password}) async {
    try {
      final response = await DioHelper.postData(
          url: PillReminderEndPoint.loginClient,
          data: {"email": email, "password": password, "fcm_token": 1234});
      return Right(PersonalDataModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
