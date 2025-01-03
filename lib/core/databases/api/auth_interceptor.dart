import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/databases/api/dio_consumer.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/secure_storage_helper.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';

import '../../../features/user/data/models/refresh_token/refresh_token_model.dart';

class AuthInterceptor extends Interceptor {
  final DioConsumer dioConsumer;

  AuthInterceptor({required this.dioConsumer});
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log("on request");
    if (options.extra[ApiKey.requiredAuth] != null &&
        options.extra[ApiKey.requiredAuth] == true) {
      final accessToken = await getLastAccessToken();
      if (accessToken != null) {
        log(accessToken);
        options.headers[ApiKey.authorization] = "Bearer $accessToken";
      }
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    log("on error");
    if (err.response!.statusCode == 401 &&
        err.requestOptions.extra[ApiKey.requiredAuth] != null &&
        err.requestOptions.extra[ApiKey.requiredAuth]) {
      final RequestOptions options = err.requestOptions;
      try {
        final success = await refreshToken(dioConsumer);
        cacheAccessToken(success.refreshTokenDataEntity.accessToken);
        options.headers[ApiKey.authorization] =
            "Bearer ${success.refreshTokenDataEntity.accessToken}";
        _retryRequest(options, handler, dioConsumer);
      } on DioException catch (e) {
        handleDioException(e);
      }
    } else {
      handler.next(err);
    }
  }

  //! retry the request:
  void _retryRequest(RequestOptions requestOptions,
      ErrorInterceptorHandler handler, DioConsumer dioConsumer) async {
    log("request retry");
    try {
      final response = await dioConsumer.dio.fetch(requestOptions);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.reject(e);
    }
  }
}

Future<String?> getLastAccessToken() async {
  SecureStorageHelper cache = getIt();
  final jsonString = await cache.getData(key: CacheKey.accessToken);
  if (jsonString != null) {
    return Future.value(jsonString);
  } else {
    throw CacheExeption(errorMessage: "NO Internet connection");
  }
}

cacheAccessToken(String? accessToken) async {
  SecureStorageHelper cache = getIt();
  if (accessToken != null) {
    await cache.saveData(key: CacheKey.accessToken, value: accessToken);
  } else {
    throw CacheExeption(errorMessage: "NO internet connection");
  }
}

Future<RefreshTokenModel> refreshToken(DioConsumer dioConsumer) async {
  SecureStorageHelper cacheHelper = getIt();

  Map<String, dynamic> headers = {
    ApiKey.deviceId: await cacheHelper.getData(key: CacheKey.fcmToken),
    ApiKey.refreshTokenHeader:
        await cacheHelper.getData(key: CacheKey.refreshToken),
  };
  final response =
      await dioConsumer.post(EndPoints.refreshToken, headers: headers);
  return RefreshTokenModel.fromMap(response);
}
