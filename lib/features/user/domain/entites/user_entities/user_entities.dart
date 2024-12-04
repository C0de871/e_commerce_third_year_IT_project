import 'package:collection/collection.dart';

import 'user.dart';

class UserEntity {
  String? accessToken;
  String? refreshToken;
  User? user;

  UserEntity({this.accessToken, this.refreshToken, this.user});

//   factory UserEntities.fromJson(Map<String, dynamic> json) => UserEntities(
//         accessToken: json['access_token'] as String?,
//         refreshToken: json['refresh_token'] as String?,
//         user: json['user'] == null
//             ? null
//             : User.fromJson(json['user'] as Map<String, dynamic>),
//       );

//   Map<String, dynamic> toJson() => {
//         'access_token': accessToken,
//         'refresh_token': refreshToken,
//         'user': user?.toJson(),
//       };

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     if (other is! UserEntities) return false;
//     final mapEquals = const DeepCollectionEquality().equals;
//     return mapEquals(other.toJson(), toJson());
//   }

//   @override
//   int get hashCode =>
//       accessToken.hashCode ^ refreshToken.hashCode ^ user.hashCode;
// 
}
