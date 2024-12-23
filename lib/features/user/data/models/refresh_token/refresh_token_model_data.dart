import 'dart:convert';

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/user/domain/entites/refresh_token/refresh_token_entity.dart';

class RefreshTokenModelData extends RefreshTokenEntity {
  RefreshTokenModelData({
    required super.accessToken,
    required super.expiresIn,
  });

  factory RefreshTokenModelData.fromMap(Map<String, dynamic> data) => RefreshTokenModelData(
        accessToken: data[ApiKey.accessToken],
        expiresIn: data[ApiKey.expiresIn],
      );

  Map<String, dynamic> toMap() => {
        ApiKey.accessToken: accessToken,
        ApiKey.expiresIn: expiresIn,
      };

  factory RefreshTokenModelData.fromJson(String data) {
    return RefreshTokenModelData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
