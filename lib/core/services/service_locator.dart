

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../connection/network_info.dart';
import '../databases/api/api_consumer.dart';
import '../databases/api/dio_consumer.dart';
import '../databases/cache/cache_helper.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setupServicesLocator() {
  // Core
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Data Sources
  // getIt.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(api: getIt()));
  // getIt.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource(cache: getIt()));

  // Repository
  // getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
  //       networkInfo: getIt(),
  //       remoteDataSource: getIt(),
  //       localDataSource: getIt(),
  //     ));

  // Use Cases
  // getIt.registerLazySingleton<GetUser>(() => GetUser(repository: getIt()));
}
