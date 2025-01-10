import 'dart:convert';

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/secure_storage_helper.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';

import '../../../../core/databases/cache/shared_prefs_helper.dart';

class UserLocalDataSource {
  final SecureStorageHelper secureCache;
  final SharedPrefsHelper sharedPrefsCache;

  UserLocalDataSource({
    required this.secureCache,
    required this.sharedPrefsCache,
  });
  cacheUser(UserModel? userToCache) async {
    if (userToCache != null) {
      await secureCache.saveData(key: CacheKey.user, value: json.encode(userToCache.toJson()));
      await secureCache.saveData(key: CacheKey.accessToken, value: userToCache.accessToken);
      await secureCache.saveData(key: CacheKey.refreshToken, value: userToCache.refreshToken);
    } else {
      throw CacheExeption(errorMessage: "NO internet connection");
    }
  }

  cacheAccessToken(String? accessToken) async {
    if (accessToken != null) {
      await secureCache.saveData(key: CacheKey.accessToken, value: accessToken);
    } else {
      throw CacheExeption(errorMessage: "NO internet connection");
    }
  }

  Future<bool> setFirstLaunch() async {
    return await sharedPrefsCache.saveData(key: CacheKey.isFirstTime, value: false);
  }

  Future<bool> isFirstLaunch() async {
    final bool? isFirstLaunch = await sharedPrefsCache.getData(key: CacheKey.isFirstTime);
    if (isFirstLaunch == null || isFirstLaunch) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel?> getLastUser() async {
    final jsonString = await secureCache.getData(key: CacheKey.user);
    if (jsonString != null) {
      return UserModel.fromJson(json.decode(jsonString));
    } else {
      // throw CacheExeption(errorMessage: "NO Internet connection");
      return null;
    }
  }

  String noInternectConnection() {
    return "NO Internet connection";
  }

  Future<String?> getLastAccessToken() async {
    final jsonString = await secureCache.getData(key: CacheKey.accessToken);
    if (jsonString != null) {
      return Future.value(jsonString);
    } else {
      throw CacheExeption(errorMessage: "NO Internet connection");
    }
  }

  Future<String> getLastRefreshToken() async {
    final jsonString = await secureCache.getData(key: CacheKey.refreshToken);
    if (jsonString != null) {
      return Future.value(jsonString);
    } else {
      throw CacheExeption(errorMessage: "NO Internet connection");
    }
  }
}
