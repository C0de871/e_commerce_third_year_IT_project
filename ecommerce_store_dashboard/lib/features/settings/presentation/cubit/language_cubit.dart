import 'dart:ui';

import 'package:bloc/bloc.dart';

import '../../../../core/utils/constants/constant.dart';
import '../../../../core/utils/services/service_locator.dart';
import '../../domain/usecases/retrieve_user_lang.dart';
import '../../domain/usecases/save_lang.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  RetrieveUserLang retrieveUserLangUseCase;
  SaveLang saveLangUseCase;

  LanguageCubit()
      : retrieveUserLangUseCase = getIt(),
        saveLangUseCase = getIt(),
        super(LanguageInitial());

  void retrieveUserLang() {
    final response = retrieveUserLangUseCase.call();

    response.fold(
      (failure) => failure.errMessage,
      (lang) {
        switch (lang) {
          case "en":
            emit(CurrentLanguage(lang: lang, langCode: lang));
          case "ar":
            emit(CurrentLanguage(lang: lang, langCode: lang));
          default:
            {
              // Get the primary locale from the system
              Locale systemLocale = PlatformDispatcher.instance.locale;

              // Extract language and country codes
              String languageCode = systemLocale.languageCode;
              emit(
                CurrentLanguage(
                  lang: Constant.deviceLang,
                  langCode: languageCode,
                ),
              );
            }
        }
      },
    );
  }

  void saveLang(String lang) async {
    final response = await saveLangUseCase.call(lang);

    response.fold(
      (failure) => failure.errMessage,
      (result) {
        retrieveUserLang();
      },
    );
  }
}
