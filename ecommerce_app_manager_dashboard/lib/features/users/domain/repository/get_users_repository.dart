import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/get_users_entity/get_users_entity.dart';

abstract class GetUsersRepository {
  Future<Either<Failure, GetUsersEntity>> getUsers();
}
