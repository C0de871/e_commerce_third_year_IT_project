
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../features/auth/data/datasourses/user_local_data_source.dart';
import '../../../features/auth/data/datasourses/user_remote_data_source.dart';
import '../../../features/auth/data/repositiries/user_repository_impl.dart';
import '../../../features/auth/domain/repository/user_repository.dart';
import '../../../features/auth/domain/usecases/get_last_user.dart';
import '../../../features/auth/domain/usecases/is_first_launch.dart';
import '../../../features/auth/domain/usecases/login_user.dart';
import '../../../features/auth/domain/usecases/post_otp.dart';
import '../../../features/auth/domain/usecases/refresh_token.dart';
import '../../../features/auth/domain/usecases/resend_otp.dart';
import '../../../features/auth/domain/usecases/set_first_launch.dart';
import '../../../features/auth/domain/usecases/sign_up_user.dart';
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

  //! Core
  getIt.registerLazySingleton<SharedPrefsHelper>(() => SharedPrefsHelper());
  getIt.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker.instance);
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! Data Sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSource(api: getIt(), cacheHelper: getIt()));
  getIt.registerLazySingleton<UserLocalDataSource>(() =>
      UserLocalDataSource(secureCache: getIt(), sharedPrefsCache: getIt()));
  getIt.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSource(sharedPrefsHelper: getIt()));
  //! Repository
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));

  getIt.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(
        localDataSource: getIt(),
      ));

  //! Use Cases
  getIt.registerLazySingleton<LoginUser>(
      () => LoginUser(userRepository: getIt()));
  getIt.registerLazySingleton<SignUpUser>(
      () => SignUpUser(userRepository: getIt()));
  getIt.registerLazySingleton<ResendOtp>(
      () => ResendOtp(userRepository: getIt()));
  getIt.registerLazySingleton<PostOtp>(() => PostOtp(userRepository: getIt()));

  getIt.registerLazySingleton<RefreshToken>(
      () => RefreshToken(userRepository: getIt()));

  getIt.registerLazySingleton<GetLastUser>(
      () => GetLastUser(userRepository: getIt()));
  getIt.registerLazySingleton<SetFirstLaunch>(
      () => SetFirstLaunch(userRepository: getIt()));
  getIt.registerLazySingleton<IsFirstLaunch>(
      () => IsFirstLaunch(userRepository: getIt()));

  getIt.registerLazySingleton<RetrieveUserLang>(
      () => RetrieveUserLang(languageRepository: getIt()));
  getIt.registerLazySingleton<SaveLang>(
      () => SaveLang(languageRepository: getIt()));
}
