part of 'language_cubit.dart';

sealed class LanguageState {
  const LanguageState();
}

final class LanguageInitial extends LanguageState {}

final class CurrentLanguage extends LanguageState {
  final String lang;
  final String langCode;
  const CurrentLanguage({
    required this.lang,
    required this.langCode,
  });
}

final class LanguageFailed extends LanguageState {}
