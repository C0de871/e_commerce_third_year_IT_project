import 'dart:developer';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entites/user_entities/sub_user_entity.dart';

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
    required super.role,
  });

  factory SubUserModel.fromJson(Map<String, dynamic> json) {
    log("profile pic is : ${json[ApiKey.imageUrl]}");
    return SubUserModel(
      id: json[ApiKey.id],
      firstName: json[ApiKey.firstName],
      lastName: json[ApiKey.lastName],
      email: json[ApiKey.email],
      location: json[ApiKey.location],
      phoneNumber: json[ApiKey.phoneNumber],
      imageUrl: json[ApiKey.imageUrl],
      fcmToken: json[ApiKey.fcmToken],
      role: json[ApiKey.role],
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.firstName: firstName,
        ApiKey.lastName: lastName,
        ApiKey.email: email,
        ApiKey.location: location,
        ApiKey.phoneNumber: phoneNumber,
        ApiKey.imageUrl: imageUrl,
        ApiKey.fcmToken: fcmToken,
        ApiKey.role: role,
      };
}
