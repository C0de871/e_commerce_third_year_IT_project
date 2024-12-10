
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/user/domain/entites/Sign%20up%20entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({
    required super.message,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> data) => SignUpModel(
        message: data[ApiKey.message] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.message: message,
      };
}
