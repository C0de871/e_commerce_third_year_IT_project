import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../domain/repository/language_repository.dart';
import '../data_sources/lang_local_data_source.dart';

class LanguageRepositoryImpl extends LanguageRepository {
  final LangLocalDataSource localDataSource;

  LanguageRepositoryImpl({required this.localDataSource});

  @override
  Either<Failure, String> retrieveUserLang() {
    try {
      final String lang = localDataSource.retrieveUserLang();
      return Right(lang);
    } on Exception catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> saveUserLang(String lang) async {
    try {
      final bool result = await localDataSource.saveUserLang(lang);
      return Right(result);
    } on Exception catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
