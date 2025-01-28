import '../../../../core/databases/api/end_points.dart';
import '../../domain/entites/user_entities/user_entities.dart';
import 'sub_models/sub_user_model.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.accessToken,
    required super.refreshToken,
    required super.subUserEntity,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json[ApiKey.data];
    return UserModel(
      accessToken: data[ApiKey.accessToken],
      refreshToken: data[ApiKey.refreshToken],
      subUserEntity: SubUserModel.fromJson(data[ApiKey.user]),
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKey.data: {
          ApiKey.accessToken: accessToken,
          ApiKey.refreshToken: refreshToken,
          ApiKey.user: subUserEntity,
        }
      };
}
