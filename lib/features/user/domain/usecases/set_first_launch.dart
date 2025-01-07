import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

class SetFirstLaunch {
  final UserRepository userRepository;

  SetFirstLaunch({required this.userRepository});
  Future<Either<Failure, bool>> call() {
    return userRepository.setFirstLaunch();
  }
}
