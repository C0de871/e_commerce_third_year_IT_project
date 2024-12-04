import 'package:collection/collection.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/sub_user_entity.dart';

class SubUserModel extends SubUserEntity {

  SubUserModel({super.id, super.name, super.email});

  factory SubUserModel.fromJson(Map<String, dynamic> json) => SubUserModel(
        id: json[ApiKey.id] ,
        name: json[ApiKey.name] ,
        email: json[ApiKey.email] ,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.name: name,
        ApiKey.email: email,
      };

  // @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! User) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toJson(), toJson());
//   }

//   @override
//   int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
// 
}