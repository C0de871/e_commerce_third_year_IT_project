import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/auth/domain/entites/user_entities/sub_user_entity.dart';

class SubUserModel extends SubUserEntity {
  SubUserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.location,
    required super.phoneNumber,
    required super.imageUrl,
    required super.fcmToken,
  });

  factory SubUserModel.fromJson(Map<String, dynamic> json) => SubUserModel(
        id: json[ApiKey.id],
        firstName: json[ApiKey.firstName],
        lastName: json[ApiKey.lastName],
        email: json[ApiKey.email],
        location: json[ApiKey.location],
        phoneNumber: json[ApiKey.phoneNumber],
        imageUrl: json[ApiKey.image],
        fcmToken: json[ApiKey.fcmToken],
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.firstName: firstName,
        ApiKey.lastName: lastName,
        ApiKey.email: email,
        ApiKey.location: location,
        ApiKey.phoneNumber: phoneNumber,
        ApiKey.image: imageUrl,
        ApiKey.fcmToken: fcmToken,
      };
}
