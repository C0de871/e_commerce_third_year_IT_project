import 'package:e_commerce/core/databases/api/api_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';
import 'package:e_commerce/features/user/domain/usecases/login_user.dart';

class UserRemoteDataSourse {
final ApiConsumer api;

  UserRemoteDataSourse({required this.api});

Future<UserModel> LoginUser(Map<String,dynamic> jsonbody) async{
    
// //todo body of request after login screen
// return ;   }
}}