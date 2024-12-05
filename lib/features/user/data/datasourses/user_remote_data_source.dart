import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';

class UserRemoteDataSource {
final ApiConsumer api;

  UserRemoteDataSource({required this.api});

Future<UserModel> loginUser(Map<String,dynamic> jsonbody) async{
  final response=await api.post(EndPoints.login,data: jsonbody);
  // print(response.)
    return UserModel.fromJson(response);
// //todo body of request after login screen
// return ;   }
}}