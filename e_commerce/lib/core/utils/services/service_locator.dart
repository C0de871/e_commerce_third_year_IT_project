

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/auth/data/datasourses/user_local_data_source.dart';
import '../../../features/auth/data/datasourses/user_remote_data_source.dart';
import '../../../features/auth/data/repositiries/user_repository_impl.dart';
import '../../../features/auth/domain/repository/user_repository.dart';
import '../../../features/auth/domain/usecases/get_last_user.dart';
import '../../../features/auth/domain/usecases/login_user.dart';
import '../../../features/auth/domain/usecases/post_otp.dart';
import '../../../features/auth/domain/usecases/refresh_token.dart';
import '../../../features/auth/domain/usecases/resend_otp.dart';
import '../../../features/auth/domain/usecases/sign_up_user.dart';
import '../../../features/cart/data/datasourses/cart_remote_data_source.dart';
import '../../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../../features/cart/data/serevice/modify_cart_service.dart';
import '../../../features/cart/domain/repository/cart_repository.dart';
import '../../../features/cart/domain/usecases/add_to_cart.dart';
import '../../../features/cart/domain/usecases/clear_cart.dart';
import '../../../features/cart/domain/usecases/delete_cart.dart';
import '../../../features/cart/domain/usecases/get_cart.dart';
import '../../../features/cart/domain/usecases/get_size_cart.dart';
import '../../../features/cart/domain/usecases/modify_cart.dart';
import '../../../features/check_out/data/datasourses/check_out_remote_data_source.dart';
import '../../../features/check_out/data/repositories/check_out_repository_impl.dart';
import '../../../features/check_out/domain/repository/check_out_repository.dart';
import '../../../features/check_out/domain/usecases/create_order.dart';
import '../../../features/favorites/data/datasources/favorites_remote_data_source.dart';
import '../../../features/favorites/data/repositories/favorites_repository_impl.dart';
import '../../../features/favorites/data/services/product_favorite_service_impl.dart';
import '../../../features/favorites/domain/repositories/favorites_repository.dart';
import '../../../features/favorites/domain/service/product_favorite_service.dart';
import '../../../features/favorites/domain/usecases/get_fav_list.dart';
import '../../../features/favorites/domain/usecases/togge_fav_off.dart';
import '../../../features/favorites/domain/usecases/toggle_fav_on.dart';
import '../../../features/get_product_details/data/data sources/get_product_details_remote_data_source.dart';
import '../../../features/get_product_details/data/repository/get_product_details_repository_imple.dart';
import '../../../features/get_product_details/domain/repository/get_product_details_repository.dart';
import '../../../features/get_product_details/domain/use_cases/get_product_details_use_case.dart';
import '../../../features/get_store_details/data/datasources/get_store_details_data_source.dart';
import '../../../features/get_store_details/data/repository/get_store_details_repository_impl.dart';
import '../../../features/get_store_details/domain/repository/get_store_details_repository.dart';
import '../../../features/get_store_details/domain/usecases/get_store_details.dart';
import '../../../features/products/data/dataSources/product_remote_data_source.dart';
import '../../../features/products/data/repository/product_repository_impl.dart';
import '../../../features/products/domain/repository/product_repository.dart';
import '../../../features/products/domain/use cases/get_all_products.dart';
import '../../../features/settings/data/data_sources/lang_local_data_source.dart';
import '../../../features/settings/data/repository/language_repository_impl.dart';
import '../../../features/settings/domain/repository/language_repository.dart';
import '../../../features/settings/domain/usecases/retrieve_user_lang.dart';
import '../../../features/settings/domain/usecases/save_lang.dart';
import '../../../features/stores/data/dataSources/store_remote_data_source.dart';
import '../../../features/stores/data/repository/store_repository_impl.dart';
import '../../../features/auth/domain/usecases/is_first_launch.dart';
import '../../../features/auth/domain/usecases/set_first_launch.dart';
import '../../../features/auth/domain/usecases/is_first_launch.dart';
import '../../../features/auth/domain/usecases/set_first_launch.dart';
import '../../../features/stores/domain/repository/store_repository.dart';
import '../../../features/stores/domain/use cases/get_all_stores.dart';
import '../../databases/cache/secure_storage_helper.dart';
import '../../databases/connection/network_info.dart';
import '../../databases/api/api_consumer.dart';
import '../../databases/api/dio_consumer.dart';
import '../../databases/cache/shared_prefs_helper.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setupServicesLocator() {
  //!service:
  getIt.registerLazySingleton<ProductFavoriteService>(
      () => ProductFavoriteServiceImpl());
  getIt.registerLazySingleton<ModifyCartService>(() => ModifyCartService());

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
  getIt.registerLazySingleton<UserLocalDataSource>(() =>
      UserLocalDataSource(secureCache: getIt(), sharedPrefsCache: getIt()));
  getIt.registerLazySingleton<ProductRemoteDataSource>(() =>
      ProductRemoteDataSource(apiConsumer: getIt(), cacheHelper: getIt()));
  getIt.registerLazySingleton<StoreRemoteDataSource>(
      () => StoreRemoteDataSource(api: getIt(), cacheHelper: getIt()));
  getIt.registerLazySingleton<FavoritesRemoteDataSource>(
      () => FavoritesRemoteDataSource(cacheHelper: getIt(), api: getIt()));
  getIt.registerLazySingleton<GetProductDetailsRemoteDataSource>(() =>
      GetProductDetailsRemoteDataSource(cacheHelper: getIt(), api: getIt()));
  getIt.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSource(api: getIt(), cacheHelper: getIt()));
  getIt.registerLazySingleton<CheckOutRemoteDataSource>(
      () => CheckOutRemoteDataSource(api: getIt(), cacheHelper: getIt()));
  getIt.registerLazySingleton<LangLocalDataSource>(() => LangLocalDataSource(sharedPrefsHelper: getIt()));
  getIt.registerLazySingleton<GetStoreDetailsDataSource>(() => GetStoreDetailsDataSource(api: getIt(), cacheHelper: getIt()));

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
  getIt
      .registerLazySingleton<FavoritesRepository>(() => FavoritesRepositoryImpl(
            remoteDataSource: getIt(),
            networkInfo: getIt(),
          ));
  getIt.registerLazySingleton<GetProductDetailsRepository>(
      () => GetProductDetailsRepositoryImpl(
            remoteDataSource: getIt(),
            networkInfo: getIt(),
          ));
  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
      ));
  getIt.registerLazySingleton<CheckOutRepository>(() => CheckOutRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
      ));
  getIt.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(
        localDataSource: getIt(),
      ));

  getIt.registerLazySingleton<GetStoreDetailsRepository>(() => GetStoreDetailsRepositoryImpl(
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
  getIt.registerLazySingleton<DeleteCart>(
      () => DeleteCart(cartRepository: getIt()));
  getIt.registerLazySingleton<ClearCart>(
      () => ClearCart(cartRepository: getIt()));
  getIt.registerLazySingleton<GetSizeCart>(
      () => GetSizeCart(cartRepository: getIt()));
  getIt.registerLazySingleton<GetAllProducts>(
      () => GetAllProducts(productRepository: getIt()));
  getIt.registerLazySingleton<GetAllStores>(
      () => GetAllStores(storeRepository: getIt()));
  getIt.registerLazySingleton<RefreshToken>(
      () => RefreshToken(userRepository: getIt()));
  getIt.registerLazySingleton<ToggleFavOn>(
      () => ToggleFavOn(repository: getIt()));
  getIt.registerLazySingleton<ToggleFavOff>(
      () => ToggleFavOff(repository: getIt()));
  getIt.registerLazySingleton<GetProductDetails>(
      () => GetProductDetails(repository: getIt()));
  getIt.registerLazySingleton<GetCart>(() => GetCart(cartRepository: getIt()));
  getIt.registerLazySingleton<ModifyCart>(
      () => ModifyCart(cartRepository: getIt()));
  getIt.registerLazySingleton<AddToCart>(
      () => AddToCart(cartRepository: getIt()));
  getIt.registerLazySingleton<GetLastUser>(
      () => GetLastUser(userRepository: getIt()));
  getIt.registerLazySingleton<SetFirstLaunch>(
      () => SetFirstLaunch(userRepository: getIt()));
  getIt.registerLazySingleton<IsFirstLaunch>(
      () => IsFirstLaunch(userRepository: getIt()));
  getIt.registerLazySingleton<GetFavList>(
      () => GetFavList(favoritesRepository: getIt()));
  getIt.registerLazySingleton<CreateOrder>(
      () => CreateOrder(checkOutRepository: getIt()));
      getIt.registerLazySingleton<RetrieveUserLang>(() => RetrieveUserLang(languageRepository: getIt()));
  getIt.registerLazySingleton<SaveLang>(() => SaveLang(languageRepository: getIt()));
  getIt.registerLazySingleton<GetStoreDetails>(() => GetStoreDetails(repository: getIt()));
}
