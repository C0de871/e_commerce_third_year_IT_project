import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entites/user_entities/user_entities.dart';
import '../repository/user_repository.dart';

class GetLastUser {
  final UserRepository userRepository;

  GetLastUser({required this.userRepository});
  Future<Either<Failure, UserEntity?>> call() {
    return userRepository.getLastUser();
  }
}
