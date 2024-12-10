import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/domain/entites/Sign%20up%20entities/sign_up_entity.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

class SignUpUser {
  UserRepository userRepository;
  SignUpUser({required this.userRepository});
  Future<Either<Failure, SignUpEntity>> call({
    required Map<String, dynamic> jsonBody,
  }) {
    return userRepository.signUpUser(jsonBody: jsonBody);
  }
}
