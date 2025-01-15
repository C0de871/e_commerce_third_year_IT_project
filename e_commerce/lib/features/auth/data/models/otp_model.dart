import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/auth/domain/entites/otp_entities/otp_entity.dart';

class OtpModel extends OtpEntity {
  OtpModel({required super.message});

  factory OtpModel.fromJson(Map<String, dynamic> data) => OtpModel(
        message: data[ApiKey.message],
      );

  Map<String, dynamic> toJson() => {
        ApiKey.message: message,
      };
}
