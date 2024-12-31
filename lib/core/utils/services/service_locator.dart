import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/features/cart/data/datasourses/cart_remote_data_source.dart';
import 'package:e_commerce/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_cart.dart';
import 'package:e_commerce/features/cart/domain/usecases/modify_cart.dart';
import 'package:e_commerce/features/products/data/dataSources/product_remote_data_source.dart';
import 'package:e_commerce/features/products/data/repository/product_repository_impl.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';
import 'package:e_commerce/features/products/domain/use%20cases/get_all_products.dart';
import 'package:e_commerce/features/stores/data/dataSources/store_remote_data_source.dart';
import 'package:e_commerce/features/stores/domain/repository/store_repository.dart';
import 'package:e_commerce/features/stores/domain/use%20cases/get_all_stores.dart';
import 'package:e_commerce/features/user/data/datasourses/user_local_data_source.dart';
import 'package:e_commerce/features/user/data/datasourses/user_remote_data_source.dart';
import 'package:e_commerce/features/user/data/repositiries/user_repository_impl.dart';
import 'package:e_commerce/features/user/domain/repository/user_repository.dart';
import 'package:e_commerce/features/user/domain/usecases/login_user.dart';
import 'package:e_commerce/features/user/domain/usecases/post_otp.dart';
import 'package:e_commerce/features/user/domain/usecases/refresh_token.dart';
import 'package:e_commerce/features/user/domain/usecases/resend_otp.dart';
import 'package:e_commerce/features/user/domain/usecases/sign_up_user.dart';
import 'package:get_it/get_it.dart';

import '../../../features/stores/data/repository/store_repository_impl.dart';
import '../../databases/cache/secure_storage_helper.dart';
import '../../databases/connection/network_info.dart';
import '../../databases/api/api_consumer.dart';
import '../../databases/api/dio_consumer.dart';
import '../../databases/cache/shared_prefs_helper.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setupServicesLocator() {
  //! Core
  getIt.registerLazySingleton<SharedPrefsHelper>(() => SharedPrefsHelper());
  getIt.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! Data Sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSource(api: getIt(), cacheHelper: getIt()));
  getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(cache: getIt()));
  getIt.registerLazySingleton<ProductRemoteDataSource>(() =>
      ProductRemoteDataSource(apiConsumer: getIt(), cacheHelper: getIt()));
  getIt.registerLazySingleton<StoreRemoteDataSource>(
      () => StoreRemoteDataSource(api: getIt(), cacheHelper: getIt()));
  getIt.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSource(api: getIt()));

  //! Repository
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
        productRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  getIt.registerLazySingleton<StoreRepository>(() => StoreRepositoryImpl(
        network: getIt(),
        remoteDataSource: getIt(),
      ));
      getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
      ));

  //! Use Cases
  getIt.registerLazySingleton<LoginUser>(
      () => LoginUser(userRepository: getIt()));
  getIt.registerLazySingleton<SignUpUser>(
      () => SignUpUser(userRepository: getIt()));
  getIt.registerLazySingleton<ResendOtp>(
      () => ResendOtp(userRepository: getIt()));
  getIt.registerLazySingleton<PostOtp>(() => PostOtp(userRepository: getIt()));
  getIt.registerLazySingleton<GetAllProducts>(
      () => GetAllProducts(productRepository: getIt()));
  getIt.registerLazySingleton<GetAllStores>(
      () => GetAllStores(storeRepository: getIt()));
  getIt.registerLazySingleton<RefreshToken>(
      () => RefreshToken(userRepository: getIt()));
  getIt.registerLazySingleton<GetCart>(
      () => GetCart(cartRepository: getIt()));
  getIt.registerLazySingleton<ModifyCart>(
      () => ModifyCart(cartRepository: getIt()));
}
