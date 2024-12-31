import 'dart:convert';

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/user/domain/entites/refresh_token/refresh_token_entity.dart';

import 'refresh_token_model_data.dart';

class RefreshTokenModel extends RefreshTokenEntity {
  bool successful;
  String message;
  int statusCode;

  RefreshTokenModel({
    required this.successful,
    required this.message,
    required super.refreshTokenDataEntity,
    required this.statusCode,
  });

  factory RefreshTokenModel.fromMap(Map<String, dynamic> data) {
    return RefreshTokenModel(
      successful: data[ApiKey.successful],
      message: data[ApiKey.message],
      refreshTokenDataEntity: RefreshTokenModelData.fromMap(
        data[ApiKey.data] as Map<String, dynamic>,
      ),
      statusCode: data[ApiKey.statusCode],
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.successful: successful,
        ApiKey.message: message,
        ApiKey.data: (refreshTokenDataEntity as RefreshTokenModelData).toMap(),
        ApiKey.statusCode: statusCode,
      };

  factory RefreshTokenModel.fromJson(String data) {
    return RefreshTokenModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
