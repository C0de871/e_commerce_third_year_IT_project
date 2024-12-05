import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

class SignUpUser {
  UserRepository userRepository;
  SignUpUser({required this.userRepository});
  Future<Either<Failure, UserEntity>> call({required Map<String, dynamic> jsonBody}) {
    return userRepository.signUpUser(jsonBody: jsonBody);
  }
}
