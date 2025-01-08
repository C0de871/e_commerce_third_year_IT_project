import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

class IsFirstLaunch {
  final UserRepository userRepository;

  IsFirstLaunch({required this.userRepository});
  Future<Either<Failure, bool>> call() {
    return userRepository.isFirstLaunch();
  }
}
