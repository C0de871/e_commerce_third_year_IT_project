import 'package:collection/collection.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';

import 'sub_models/sub_user_model.dart';

class UserModel  extends UserEntity {
  
  UserModel({required super.accessToken, super.refreshToken, super.subUserEntity});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json[ApiKey.accessToken],
        refreshToken: json[ApiKey.refreshToken],
        subUserEntity: SubUserModel.fromJson(json[ApiKey.user])
      );

  Map<String, dynamic> toJson() => {
        ApiKey.accessToken: accessToken,
        ApiKey.refreshToken: refreshToken,
        ApiKey.user: subUserEntity
      };

  // @override
  // bool operator ==(Object other) {
  //   if (identical(other, this)) return true;
  //   if (other is! UserModel) return false;
  //   final mapEquals = const DeepCollectionEquality().equals;
  //   return mapEquals(other.toJson(), toJson());
  // }

  // @override
  // int get hashCode =>
  //     accessToken.hashCode ^ refreshToken.hashCode ^ user.hashCode;
}
