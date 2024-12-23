import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/user/domain/entites/refresh_token/refresh_token_entity.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

import '../../../../core/databases/errors/failure.dart';

class RefreshToken {
  final UserRepository userRepository;

  RefreshToken({required this.userRepository});

  Future<Either<Failure, RefreshTokenEntity>> call() {
    return userRepository.refreshToken();
  }
}
