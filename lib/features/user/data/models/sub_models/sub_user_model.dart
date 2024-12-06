import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/sub_user_entity.dart';

class SubUserModel extends SubUserEntity {
  SubUserModel({
    required super.id,
    required super.name,
    required super.email,
  });

  factory SubUserModel.fromJson(Map<String, dynamic> json) => SubUserModel(
        id: json[ApiKey.id],
        name: json[ApiKey.name],
        email: json[ApiKey.email],
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.name: name,
        ApiKey.email: email,
      };
}
