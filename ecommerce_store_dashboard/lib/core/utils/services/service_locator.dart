import 'package:dio/dio.dart';
import 'package:ecommerce_store_dashboard/features/products/data/data%20sources/products_remote_data_source.dart';
import 'package:ecommerce_store_dashboard/features/products/data/services/delete_product_service.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/repository/products_repository.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/use_cases/delete_product_use_case.dart';
import 'package:ecommerce_store_dashboard/features/products/domain/use_cases/show_store_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../features/auth/data/datasourses/user_local_data_source.dart';
import '../../../features/auth/data/datasourses/user_remote_data_source.dart';
import '../../../features/auth/data/repositiries/user_repository_impl.dart';
import '../../../features/auth/domain/repository/user_repository.dart';
import '../../../features/auth/domain/usecases/get_last_user.dart';
import '../../../features/auth/domain/usecases/is_first_launch.dart';
import '../../../features/auth/domain/usecases/login_user.dart';
import '../../../features/auth/domain/usecases/refresh_token.dart';
import '../../../features/auth/domain/usecases/set_first_launch.dart';
import '../../../features/products/data/repository/products_repository_imple.dart';
import '../../../features/products/domain/use_cases/add_product_use_case.dart';
import '../../../features/settings/data/data_sources/lang_local_data_source.dart';
import '../../../features/settings/data/repository/language_repository_impl.dart';
import '../../../features/settings/domain/repository/language_repository.dart';
import '../../../features/settings/domain/usecases/retrieve_user_lang.dart';
import '../../../features/settings/domain/usecases/save_lang.dart';
import '../../databases/api/api_consumer.dart';
import '../../databases/api/dio_consumer.dart';
import '../../databases/cache/secure_storage_helper.dart';
import '../../databases/cache/shared_prefs_helper.dart';
import '../../databases/connection/network_info.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setupServicesLocator() {
  //!service:
  getIt.registerLazySingleton<DeleteProductService>(() => DeleteProductService());

  //! Core
  getIt.registerLazySingleton<SharedPrefsHelper>(() => SharedPrefsHelper());
  getIt.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker.instance);
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! Data Sources
  getIt.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(api: getIt(), cacheHelper: getIt()));
  getIt.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource(secureCache: getIt(), sharedPrefsCache: getIt()));
  getIt.registerLazySingleton<LangLocalDataSource>(() => LangLocalDataSource(sharedPrefsHelper: getIt()));
  getIt.registerLazySingleton<ProductsRemoteDataSource>(() => ProductsRemoteDataSource(api: getIt(), cacheHelper: getIt()));

  //! Repository
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));

  getIt.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
      ));

  getIt.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(
        localDataSource: getIt(),
      ));

  //! Use Cases
  getIt.registerLazySingleton<LoginUser>(() => LoginUser(userRepository: getIt()));

  getIt.registerLazySingleton<RefreshToken>(() => RefreshToken(userRepository: getIt()));

  getIt.registerLazySingleton<GetLastUser>(() => GetLastUser(userRepository: getIt()));
  getIt.registerLazySingleton<SetFirstLaunch>(() => SetFirstLaunch(userRepository: getIt()));
  getIt.registerLazySingleton<IsFirstLaunch>(() => IsFirstLaunch(userRepository: getIt()));

  getIt.registerLazySingleton<RetrieveUserLang>(() => RetrieveUserLang(languageRepository: getIt()));
  getIt.registerLazySingleton<SaveLang>(() => SaveLang(languageRepository: getIt()));
  getIt.registerLazySingleton<AddProduct>(() => AddProduct(repository: getIt()));
  getIt.registerLazySingleton<ShowStoreUseCase>(() => ShowStoreUseCase(repository: getIt()));

  getIt.registerLazySingleton<DeleteProductUseCase>(() => DeleteProductUseCase(repository: getIt()));
}
