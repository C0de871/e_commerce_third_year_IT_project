import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/get_users_entity/get_users_entity.dart';
import '../entities/update_role_entity/update_role_entity.dart';

abstract class GetUsersRepository {
  Future<Either<Failure, GetUsersEntity>> getUsers();
   Future<Either<Failure, AssignRoleEntity>> updateUserRole({
    required int userId,
    required String role,
  });
}
