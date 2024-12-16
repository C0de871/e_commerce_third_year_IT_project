import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/connection/network_info.dart';
import 'package:e_commerce/core/errors/expentions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/data/datasourses/user_local_data_source.dart';
import 'package:e_commerce/features/user/data/datasourses/user_remote_data_source.dart';
import 'package:e_commerce/features/user/domain/entites/Sign%20up%20entities/sign_up_entity.dart';
import 'package:e_commerce/features/user/domain/entites/otp_entities/otp_entity.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

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
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
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
}
