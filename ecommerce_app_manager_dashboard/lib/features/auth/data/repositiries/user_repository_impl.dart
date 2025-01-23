import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../domain/entites/Sign up entities/sign_up_entity.dart';
import '../../domain/entites/otp_entities/otp_entity.dart';
import '../../domain/entites/refresh_token/refresh_token_entity.dart';
import '../../domain/entites/user_entities/user_entities.dart';
import '../../domain/repository/user_repository.dart';
import '../datasourses/user_local_data_source.dart';
import '../datasourses/user_remote_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required Map<String, dynamic> bodyjson,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remoteDataSource.loginUser(bodyjson);
        await localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      // try {
      // final localUser = await localDataSource.getLastUser();
      // if(localUser!=null){
      // return Right(localUser);
      // }
      // } on CacheExeption catch (e) {
      return Left(Failure(errMessage: "NO Internet connection"));
      // }
    }
  }

  @override
  Future<Either<Failure, SignUpEntity>> signUpUser(
      {required Map<String, dynamic> jsonBody}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteSignUpModel = await remoteDataSource.signUpUser(jsonBody);
        return Right(remoteSignUpModel);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(
        Failure(
          errMessage: localDataSource.noInternectConnection(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, OtpEntity>> resendOtp({
    required Map<String, dynamic> bodyjson,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteResendOtp = await remoteDataSource.resendOtp(bodyjson);
        return Right(remoteResendOtp);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(
        Failure(
          errMessage: localDataSource.noInternectConnection(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, OtpEntity>> postOtp({
    required Map<String, dynamic> bodyjson,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteResendOtp = await remoteDataSource.postOtp(bodyjson);
        return Right(remoteResendOtp);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(
        Failure(
          errMessage: localDataSource.noInternectConnection(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RefreshTokenEntity>> refreshToken() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteRefreshing = await remoteDataSource.refreshToken();
        await localDataSource.cacheAccessToken(
            remoteRefreshing.refreshTokenDataEntity.accessToken);
        return Right(remoteRefreshing);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(
        Failure(
          errMessage: localDataSource.noInternectConnection(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getLastUser() async {
    try {
      final user = await localDataSource.getLastUser();
      return Right(user);
    } on PlatformException catch (e) {
      return Left(
        Failure(
          errMessage: e.message ?? e.details ?? e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isFirstLaunch() async {
    try {
      final bool isFirstLaunch = await localDataSource.isFirstLaunch();
      return Right(isFirstLaunch);
    } on Exception catch (e) {
      return Left(
        Failure(errMessage: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> setFirstLaunch() async {
    try {
      final bool success = await localDataSource.setFirstLaunch();
      if (success) {
        return const Right(false);
      } else {
        return Left(Failure(errMessage: "Failed To set first launch"));
      }
    } on Exception catch (e) {
      return Left(
        Failure(errMessage: e.toString()),
      );
    }
  }
}
