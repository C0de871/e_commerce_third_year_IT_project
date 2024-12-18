import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/cache_helper.dart';
import 'package:e_commerce/features/user/data/models/otp_model.dart';
import 'package:e_commerce/features/user/data/models/sign_up_model.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;
  final CacheHelper cacheHelper;

  UserRemoteDataSource({required this.api, required this.cacheHelper});

  Future<UserModel> loginUser(Map<String, dynamic> jsonbody) async {
    Map<String, dynamic> headers = {
      ApiKey.deviceId: cacheHelper.getData(key: CacheKey.fcmToken),
    };
    final response = await api.post(
      EndPoints.login,
      data: jsonbody,
      headers: headers,
    );
    return UserModel.fromJson(response);
  }

  Future<SignUpModel> signUpUser(Map<String, dynamic> jsonbody) async {
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await api.post(
      EndPoints.signUp,
      data: jsonbody,
      headers: headers,
      isFormData: true,
    );
    return SignUpModel.fromJson(response);
  }

  Future<OtpModel> resendOtp(Map<String, dynamic> jsonbody) async {
    final response = await api.post(
      EndPoints.otpResend,
      data: jsonbody,
    );
    return OtpModel.fromJson(response);
  }

  Future<OtpModel> postOtp(Map<String, dynamic> jsonbody) async {
    final response = await api.post(
      EndPoints.otpValidate,
      data: jsonbody,
    );
    return OtpModel.fromJson(response);
  }
}
