import 'dart:developer';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/settings/data/data_sources/lang_local_data_source.dart';
import 'package:e_commerce/features/settings/domain/repository/language_repository.dart';

import '../../../../core/databases/errors/failure.dart';

class LanguageRepositoryImpl extends LanguageRepository{
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
