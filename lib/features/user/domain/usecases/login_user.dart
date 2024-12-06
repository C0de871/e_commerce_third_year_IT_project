import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

class LoginUser {
  final UserRepository userRepository;

  LoginUser({required this.userRepository});
  Future<Either<Failure, UserEntity>> call({
    required Map<String, dynamic> bodyjson,
  }) {
    return userRepository.loginUser(bodyjson: bodyjson);
  }
}
