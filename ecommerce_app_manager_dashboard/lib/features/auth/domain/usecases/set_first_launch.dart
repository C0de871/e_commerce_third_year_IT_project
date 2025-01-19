import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../repository/user_repository.dart';

class SetFirstLaunch {
  final UserRepository userRepository;

  SetFirstLaunch({required this.userRepository});
  Future<Either<Failure, bool>> call() {
    return userRepository.setFirstLaunch();
  }
}
