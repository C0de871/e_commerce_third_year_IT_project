import 'package:collection/collection.dart';

class SubUserEntity {
  int? id;
  String? name;
  String? email;

  SubUserEntity({this.id, this.name, this.email});

//   factory SubUserEntity.fromJson(Map<String, dynamic> json) => User(
//         id: json['id'] as int?,
//         name: json['name'] as String?,
//         email: json['email'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'email': email,
//       };

//   @override
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