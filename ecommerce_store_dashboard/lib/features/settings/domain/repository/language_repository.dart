import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';

abstract class LanguageRepository {
  Either<Failure, String> retrieveUserLang();
  Future<Either<Failure, bool>> saveUserLang(String lang);
}
