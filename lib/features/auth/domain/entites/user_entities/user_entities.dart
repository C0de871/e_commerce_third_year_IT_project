import 'sub_user_entity.dart';

class UserEntity {
  String? accessToken;
  String? refreshToken;
  SubUserEntity? subUserEntity;

  UserEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.subUserEntity,
  });
}
