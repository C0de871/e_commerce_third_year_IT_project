import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/data/models/otp_model.dart';
import 'package:e_commerce/features/user/data/models/sign_up_model.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';
import 'package:e_commerce/features/user/domain/entites/otp_entities/otp_entity.dart';
import 'package:e_commerce/features/user/domain/usecases/resend_otp.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});

  Future<UserModel> loginUser(Map<String, dynamic> jsonbody) async {
    Map<String, dynamic> headers = {
      ApiKey.deviceId: 4,
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
      'Cookie':
          'just_go_deliver_app_session=ZVV1HxCQriLIQRYZZzHqh7Xw3wT2YeW1iQiIpb9q',
    };
    final response = await api.post(
      EndPoints.signUp,
      data: jsonbody,
      headers: headers,
    );
    return SignUpModel.fromJson(response);
  }

  Future<OtpModel> resendOtp(
      Map<String, dynamic> jsonbody) async {
    final response = await api.post(
      EndPoints.otpResend,
      data: jsonbody,
    );
    return OtpModel.fromJson(response);
  }

  Future<OtpModel> postOtp(
      Map<String, dynamic> jsonbody) async {
    final response = await api.post(
      EndPoints.otpValidate,
      data: jsonbody,
    );
    return OtpModel.fromJson(response);
  }
}
