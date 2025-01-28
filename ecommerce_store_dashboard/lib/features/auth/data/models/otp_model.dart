import '../../../../core/databases/api/end_points.dart';
import '../../domain/entites/otp_entities/otp_entity.dart';

class OtpModel extends OtpEntity {
  OtpModel({required super.message});

  factory OtpModel.fromJson(Map<String, dynamic> data) => OtpModel(
        message: data[ApiKey.message],
      );

  Map<String, dynamic> toJson() => {
        ApiKey.message: message,
      };
}
