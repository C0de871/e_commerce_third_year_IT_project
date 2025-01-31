import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';

abstract class SettingsRepository {
  Either<Failure, String> retrieveUserLang();
  Future<Either<Failure, bool>> saveUserLang(String lang);

  Either<Failure, String> retrieveAppTheme();
  Future<Either<Failure, bool>> saveAppTheme(String appTheme);
}
