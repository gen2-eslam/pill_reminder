import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pill_reminder/core/error/failure.dart';
import 'package:pill_reminder/core/networking/dio_helpers.dart';
import 'package:pill_reminder/core/networking/pill_reminder_end_point.dart';
import 'package:pill_reminder/model/register/register_model.dart';
import 'package:pill_reminder/model/register/register_response.dart';
import 'package:pill_reminder/model/verifiy_user/verfiy_user.dart';

abstract class RegisterRepo {
  Future<Either<Failures, RegisterResponse>> register(
      RegisterModel registerModel);
  Future<Either<Failures, RegisterResponse>> verifyUser(
      {required VerifyUser verifyUser});
  Future<Either<Failures, RegisterResponse>> sendCodeAgain(
      {required VerifyUser verifyUser});
}

class RegisterRepoImpl implements RegisterRepo {
  @override
  Future<Either<Failures, RegisterResponse>> register(
      RegisterModel registerModel) async {
    try {
      final response = await DioHelper.postData(
        url: PillReminderEndPoint.registerClient,
        data: registerModel.toJson(),
      );
      return Right(RegisterResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, RegisterResponse>> verifyUser(
      {required VerifyUser verifyUser}) async {
    try {
      final response = await DioHelper.postData(
        url: PillReminderEndPoint.verifyUser,
        data: verifyUser.toJson(),
      );
      return Right(RegisterResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, RegisterResponse>> sendCodeAgain(
      {required VerifyUser verifyUser}) async {
    try {
      final response = await DioHelper.postData(
        url: PillReminderEndPoint.resendCode,
        data: verifyUser.reSend(),
      );
      return Right(RegisterResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
