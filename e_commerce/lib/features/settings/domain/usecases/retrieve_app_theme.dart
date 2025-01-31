import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../repository/language_repository.dart';

class RetrieveAppTheme {
  final SettingsRepository repository;
  RetrieveAppTheme({required this.repository});

  Either<Failure, String> call() {
    return repository.retrieveAppTheme();
  }
}
