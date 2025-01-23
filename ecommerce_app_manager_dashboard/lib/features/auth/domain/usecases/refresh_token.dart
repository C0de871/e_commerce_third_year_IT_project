import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entites/refresh_token/refresh_token_entity.dart';
import '../repository/user_repository.dart';

class RefreshToken {
  final UserRepository userRepository;

  RefreshToken({required this.userRepository});

  Future<Either<Failure, RefreshTokenEntity>> call() {
    return userRepository.refreshToken();
  }
}
