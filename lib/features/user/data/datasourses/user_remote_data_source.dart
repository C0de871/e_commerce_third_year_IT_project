import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/user/data/models/sign_up_model.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});

  Future<UserModel> loginUser(Map<String, dynamic> jsonbody) async {
    Map<String, dynamic> headers = {
      ApiKey.deviceId: 1,
    };
    final response = await api.post(
      EndPoints.login,
      data: jsonbody,
      headers: headers,
    );
    return UserModel.fromJson(response);
  }

  Future<SignUpModel> signUpUser(Map<String, dynamic> jsonbody) async {
    final response = await api.post(EndPoints.signUp, data: jsonbody);
    return SignUpModel.fromJson(response);
  }
}
