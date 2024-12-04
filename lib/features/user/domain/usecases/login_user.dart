import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/data/repository/user_repository.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';

class LoginUser {
  final UserRepository userRepository;

  LoginUser({required this.userRepository});
  Future<Either<Failure, UserEntity>> call({ required Map<String,dynamic> bodyjson}) {
    return userRepository.loginUser(bodyjson: bodyjson);
  }
}