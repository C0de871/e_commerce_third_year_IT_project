// assign_role_model.dart
import 'dart:convert';

import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/update_role_entity/update_role_entity.dart';

class AssignRoleModel extends AssignRoleEntity {
  AssignRoleModel({
    required super.successful,
    required super.message,
    required super.statusCode,
  });

  factory AssignRoleModel.fromMap(Map<String, dynamic> data) => AssignRoleModel(
        successful: data[ApiKey.successful] as bool,
        message: data[ApiKey.message] as String,
        statusCode: data[ApiKey.statusCode] as int,
      );

  Map<String, dynamic> toMap() => {
        ApiKey.successful: successful,
        ApiKey.message: message,
        ApiKey.statusCode: statusCode,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AssignRoleModel].
  factory AssignRoleModel.fromJson(String data) {
    return AssignRoleModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AssignRoleModel] to a JSON string.
  String toJson() => json.encode(toMap());
}