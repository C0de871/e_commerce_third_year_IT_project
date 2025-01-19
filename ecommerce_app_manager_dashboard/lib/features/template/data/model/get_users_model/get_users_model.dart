import 'dart:convert';

import 'package:ecommerce_app_manager_dashboard/features/template/domain/entities/get_users_entity/data_entity.dart';

import '../../../domain/entities/get_users_entity/get_users_entity.dart';
import 'data_model.dart';

class GetUsersModel extends GetUsersEntity {
  GetUsersModel({
    required super.successful,
    required super.data,
    required super.statusCode,
  });

  factory GetUsersModel.fromMap(Map<String, dynamic> data) => GetUsersModel(
        successful: data['successful'] as bool,
        data: (data['data'] as List<dynamic>).map((e) => DataModel.fromMap(e as Map<String, dynamic>)).toList(),
        statusCode: data['status_code'] as int,
      );

  Map<String, dynamic> toMap() => {
        'successful': successful,
        'data': data.map((e) => (e as DataModel).toMap()).toList(),
        'status_code': statusCode,
      };

  GetUsersModel copyWith({
    bool? successful,
    List<DataModel>? data,
    int? statusCode,
  }) {
    return GetUsersModel(
      successful: successful ?? this.successful,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
