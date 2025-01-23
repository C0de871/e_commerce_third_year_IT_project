import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/get_users_entity/get_users_entity.dart';
import '../repository/get_users_repository.dart';

class GetUsers {
  final GetUsersRepository repository;

  GetUsers({required this.repository});

  Future<Either<Failure, GetUsersEntity>> call() {
    return repository.getUsers();
  }
}
