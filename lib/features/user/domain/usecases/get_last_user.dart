import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

class GetLastUser {
  final UserRepository userRepository;

  GetLastUser({required this.userRepository});
  Future<Either<Failure, UserEntity?>> call() {
    return userRepository.getLastUser();
  }
}
