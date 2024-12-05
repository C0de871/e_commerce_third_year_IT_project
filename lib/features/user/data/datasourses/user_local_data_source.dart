import 'dart:convert';

import 'package:e_commerce/core/databases/cache/cache_helper.dart';
import 'package:e_commerce/core/errors/expentions.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';

class UserLocalDataSource {
final CacheHelper cache;
final String cacheUserKey= "CachedUser";
final String cacheAccessTokenKey="accessKey";
final String cacheRefreshTokenKey="refreshKey";


  UserLocalDataSource({required this.cache});
cacheUser(UserModel? userToCache){
  if(userToCache != null){
cache.saveData(key: cacheUserKey, value:json.encode(userToCache.toJson()) );
cache.saveData(key: cacheAccessTokenKey, value:userToCache.accessToken);
cache.saveData(key: cacheRefreshTokenKey, value:userToCache.refreshToken);
  }else{
    throw CacheExeption(errorMessage: "NO internet connection"); 
  }
}


Future<UserModel> getLastUser(){

final jsonString =cache.getDataString(key:cacheUserKey);
if(jsonString != null){
return  Future.value(UserModel.fromJson(json.decode(jsonString)));
}else{
  throw CacheExeption(errorMessage: "NO Internet connection");
}
}
Future<String> getLastAccessToken(){

final jsonString =cache.getDataString(key:cacheAccessTokenKey);
if(jsonString != null){
return  Future.value(jsonString);
}else{
  throw CacheExeption(errorMessage: "NO Internet connection");
}
}
Future<String> getLastRefreshToken(){

final jsonString =cache.getDataString(key:cacheRefreshTokenKey);
if(jsonString != null){
return  Future.value(jsonString);
}else{
  throw CacheExeption(errorMessage: "NO Internet connection");
}
}
//كول رجلي و لا رجلي 
}