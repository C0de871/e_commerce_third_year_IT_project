import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entites/Sign up entities/sign_up_entity.dart';
import '../repository/user_repository.dart';

class SignUpUser {
  UserRepository userRepository;
  SignUpUser({required this.userRepository});
  Future<Either<Failure, SignUpEntity>> call({
    required Map<String, dynamic> jsonBody,
  }) {
    return userRepository.signUpUser(jsonBody: jsonBody);
  }
}
