import '../../../../core/databases/api/end_points.dart';
import '../../domain/entites/Sign up entities/sign_up_entity.dart';

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
