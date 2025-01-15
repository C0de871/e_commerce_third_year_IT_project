import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entites/user_entities/user_entities.dart';
import '../repository/user_repository.dart';

class LoginUser {
  final UserRepository userRepository;

  LoginUser({required this.userRepository});
  Future<Either<Failure, UserEntity>> call({
    required Map<String, dynamic> bodyjson,
  }) {
    return userRepository.loginUser(bodyjson: bodyjson);
  }
}
