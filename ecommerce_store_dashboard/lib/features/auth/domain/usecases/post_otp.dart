import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entites/otp_entities/otp_entity.dart';
import '../repository/user_repository.dart';

class PostOtp {
  final UserRepository userRepository;

  PostOtp({required this.userRepository});

  Future<Either<Failure, OtpEntity>> call({
    required Map<String, dynamic> bodyjson,
  }) {
    return userRepository.postOtp(bodyjson: bodyjson);
  }
}
