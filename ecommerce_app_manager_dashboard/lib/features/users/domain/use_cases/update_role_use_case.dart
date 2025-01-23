import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/update_role_entity/update_role_entity.dart';
import '../repository/get_users_repository.dart';

class UpdateUserRole {
  final GetUsersRepository repository;

  UpdateUserRole({required this.repository});

  Future<Either<Failure, AssignRoleEntity>> call({
    required int userId,
    required String role,
  }) {
    return repository.updateUserRole(
      userId: userId,
      role: role,
    );
  }
}