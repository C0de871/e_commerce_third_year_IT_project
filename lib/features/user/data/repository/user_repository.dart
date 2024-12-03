import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/data/entites/user_entities.dart';

abstract class UserRepository {
  Future<Either<Failure,UserEntities>> loginUser(
    // "username"=
  );
}