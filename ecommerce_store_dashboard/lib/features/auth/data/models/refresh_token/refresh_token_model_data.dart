import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entites/refresh_token/refresh_token_data_entity.dart';


class RefreshTokenModelData extends RefreshTokenDataEntity {
  RefreshTokenModelData({
    required super.accessToken,
    required super.expiresIn,
  });

  factory RefreshTokenModelData.fromMap(Map<String, dynamic> data) =>
      RefreshTokenModelData(
        accessToken: data[ApiKey.accessToken],
        expiresIn: data[ApiKey.expiresIn],
      );

  Map<String, dynamic> toMap() => {
        ApiKey.accessToken: accessToken,
        ApiKey.expiresIn: expiresIn,
      };

  factory RefreshTokenModelData.fromJson(String data) {
    return RefreshTokenModelData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
