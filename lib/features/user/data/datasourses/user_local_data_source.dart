import 'dart:convert';

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/cache_helper.dart';
import 'package:e_commerce/core/errors/expentions.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cache;

  UserLocalDataSource({required this.cache});
  cacheUser(UserModel? userToCache) {
    if (userToCache != null) {
      cache.saveData(key: CacheKey.user, value: json.encode(userToCache.toJson()));
      cache.saveData(key: CacheKey.accessToken, value: userToCache.accessToken);
      cache.saveData(key: CacheKey.refreshToken, value: userToCache.refreshToken);
    } else {
      throw CacheExeption(errorMessage: "NO internet connection");
    }
  }

  Future<UserModel> getLastUser() {
    final jsonString = cache.getDataString(key: CacheKey.user);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "NO Internet connection");
    }
  }

  String noInternectConnection() {
    return "NO Internet connection";
  }

  Future<String> getLastAccessToken() {
    final jsonString = cache.getDataString(key: CacheKey.accessToken);
    if (jsonString != null) {
      return Future.value(jsonString);
    } else {
      throw CacheExeption(errorMessage: "NO Internet connection");
    }
  }

  Future<String> getLastRefreshToken() {
    final jsonString = cache.getDataString(key: CacheKey.refreshToken);
    if (jsonString != null) {
      return Future.value(jsonString);
    } else {
      throw CacheExeption(errorMessage: "NO Internet connection");
    }
  }
}
