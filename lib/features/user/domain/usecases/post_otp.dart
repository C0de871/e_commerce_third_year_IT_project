import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/user/domain/entites/otp_entities/otp_entity.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

class PostOtp {
  final UserRepository userRepository;

  PostOtp({required this.userRepository});

  Future<Either<Failure, OtpEntity>> call({
    required Map<String, dynamic> bodyjson,
  }) {
    return userRepository.postOtp(bodyjson: bodyjson);
  }
}
