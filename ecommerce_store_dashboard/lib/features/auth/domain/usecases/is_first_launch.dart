import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../repository/user_repository.dart';

class IsFirstLaunch {
  final UserRepository userRepository;

  IsFirstLaunch({required this.userRepository});
  Future<Either<Failure, bool>> call() {
    return userRepository.isFirstLaunch();
  }
}
