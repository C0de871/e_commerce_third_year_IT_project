import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../repository/language_repository.dart';

class SaveLang {
  final LanguageRepository languageRepository;

  SaveLang({required this.languageRepository});

  Future<Either<Failure, bool>> call(String lang) {
    return languageRepository.saveUserLang(lang);
  }
}
