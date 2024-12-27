import 'dart:convert';

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/secure_storage_helper.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';

class UserLocalDataSource {
  final SecureStorageHelper cache;

  UserLocalDataSource({required this.cache});
  cacheUser(UserModel? userToCache) async {
    if (userToCache != null) {
      await cache.saveData(
          key: CacheKey.user, value: json.encode(userToCache.toJson()));
      await cache.saveData(
          key: CacheKey.accessToken, value: userToCache.accessToken);
      await cache.saveData(
          key: CacheKey.refreshToken, value: userToCache.refreshToken);
    } else {
      throw CacheExeption(errorMessage: "NO internet connection");
    }
  }

  cacheAccessToken(String? accessToken) async {
    if (accessToken != null) {
      await cache.saveData(key: CacheKey.accessToken, value: accessToken);
    } else {
      throw CacheExeption(errorMessage: "NO internet connection");
    }
  }

  Future<UserModel> getLastUser() async {
    final jsonString = await cache.getData(key: CacheKey.user);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "NO Internet connection");
    }
  }

  String noInternectConnection() {
    return "NO Internet connection";
  }

  Future<String?> getLastAccessToken() async {
    final jsonString = await cache.getData(key: CacheKey.accessToken);
    if (jsonString != null) {
      return Future.value(jsonString);
    } else {
      throw CacheExeption(errorMessage: "NO Internet connection");
    }
  }

  Future<String> getLastRefreshToken() async {
    final jsonString = await cache.getData(key: CacheKey.refreshToken);
    if (jsonString != null) {
      return Future.value(jsonString);
    } else {
      throw CacheExeption(errorMessage: "NO Internet connection");
    }
  }
}
