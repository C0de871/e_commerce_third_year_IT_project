import 'dart:convert';

import 'package:e_commerce/core/databases/api/end_points.dart';

import 'refresh_token_model_data.dart';

class RefreshTokenModel {
  bool? successful;
  String? message;
  RefreshTokenModelData? refreshTokenModelData;
  int? statusCode;

  RefreshTokenModel({
    this.successful,
    this.message,
    this.refreshTokenModelData,
    this.statusCode,
  });

  factory RefreshTokenModel.fromMap(Map<String, dynamic> data) {
    return RefreshTokenModel(
      successful: data[ApiKey.successful],
      message: data[ApiKey.message],
      refreshTokenModelData: data[ApiKey.data] == null
          ? null
          : RefreshTokenModelData.fromMap(
              data[ApiKey.data] as Map<String, dynamic>,
            ),
      statusCode: data[ApiKey.statusCode],
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.successful: successful,
        ApiKey.message: message,
        ApiKey.data: refreshTokenModelData?.toMap(),
        ApiKey.statusCode: statusCode,
      };

  factory RefreshTokenModel.fromJson(String data) {
    return RefreshTokenModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
