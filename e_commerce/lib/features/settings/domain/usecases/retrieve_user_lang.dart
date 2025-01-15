import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../repository/language_repository.dart';

class RetrieveUserLang {
  final LanguageRepository languageRepository;
  RetrieveUserLang({required this.languageRepository});

  Either<Failure, String> call() {
    return languageRepository.retrieveUserLang();
  }
}
