import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../features/auth/data/models/refresh_token/refresh_token_model.dart';
import '../../utils/services/service_locator.dart';
import '../cache/secure_storage_helper.dart';
import '../errors/expentions.dart';
import 'dio_consumer.dart';
import 'end_points.dart';

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
      if (requestOptions.data is FormData) {
        final formData = requestOptions.data as FormData;

        // Create a new FormData object
        final newFormData = FormData();

        // Re-add all fields from the old FormData
        newFormData.fields.addAll(formData.fields);

        // Add fresh MultipartFile objects to avoid reusing finalized ones
        for (var file in formData.files) {
          file.value.clone();
          // Assuming file.value is a File object, so you can use file.value.path
          newFormData.files.add(MapEntry(file.key, file.value.clone()));
        }

        // Assign the new FormData to the request options
        requestOptions.data = newFormData;
      }

      // Retry the request
      final response = await dioConsumer.dio.fetch(requestOptions);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.reject(e);
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
}
