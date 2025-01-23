import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entites/Sign up entities/sign_up_entity.dart';
import '../entites/otp_entities/otp_entity.dart';
import '../entites/refresh_token/refresh_token_entity.dart';
import '../entites/user_entities/user_entities.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> loginUser({
    required Map<String, dynamic> bodyjson,
  });
  Future<Either<Failure, SignUpEntity>> signUpUser({
    required Map<String, dynamic> jsonBody,
  });

  Future<Either<Failure, OtpEntity>> resendOtp({
    required Map<String, dynamic> bodyjson,
  });
  Future<Either<Failure, OtpEntity>> postOtp({
    required Map<String, dynamic> bodyjson,
  });

  Future<Either<Failure, RefreshTokenEntity>> refreshToken();

  Future<Either<Failure, UserEntity?>> getLastUser();

  Future<Either<Failure, bool>> setFirstLaunch();

  Future<Either<Failure, bool>> isFirstLaunch();
}
