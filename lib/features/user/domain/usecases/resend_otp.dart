import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/user/domain/entites/otp_entities/otp_entity.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';

class ResendOtp {
  final UserRepository userRepository;

  ResendOtp({required this.userRepository});

  Future<Either<Failure, OtpEntity>> call({
  required Map<String, dynamic> bodyjson,
  }) {
    return userRepository.resendOtp(bodyjson: bodyjson);
  }
}
