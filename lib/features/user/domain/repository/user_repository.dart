import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> loginUser({required Map<String, dynamic> bodyjson});
  Future<Either<Failure, UserEntity>> signUpUser({required Map<String, dynamic> jsonBody});
}
