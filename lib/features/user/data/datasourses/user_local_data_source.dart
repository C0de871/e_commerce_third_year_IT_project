import 'dart:convert';

import 'package:e_commerce/core/databases/cache/cache_helper.dart';
import 'package:e_commerce/core/errors/expentions.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';
import 'package:svg_flutter/svg.dart';

class UserLocalDataSource {
final CacheHelper cache;
final String key= "CachedUser";

  UserLocalDataSource({required this.cache});
CacheUser(UserModel? userToCache){
  if(userToCache != null){
cache.saveData(key: key, value:json.encode(userToCache.toJson()) );
  }else{
    throw CacheExeption(errorMessage: "NO internet connection"); 
  }
}

Future<UserModel> getLastUser(){

final jsonString =cache.getDataString(key: key);
if(jsonString != null){
return  Future.value(UserModel.fromJson(json.decode(jsonString)));
}else{
  throw CacheExeption(errorMessage: "NO Internet connection");
}
}
}