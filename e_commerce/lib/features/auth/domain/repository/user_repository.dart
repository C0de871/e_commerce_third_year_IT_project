import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/entites/Sign%20up%20entities/sign_up_entity.dart';
import 'package:e_commerce/features/auth/domain/entites/refresh_token/refresh_token_entity.dart';
import 'package:e_commerce/features/auth/domain/entites/user_entities/user_entities.dart';

import '../entites/otp_entities/otp_entity.dart';

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
