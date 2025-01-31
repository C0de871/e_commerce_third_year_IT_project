import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/settings/domain/usecases/retrieve_app_theme.dart';

import '../../../../../core/utils/constants/constant.dart';
import '../../../../../core/utils/services/service_locator.dart';
import '../../../domain/usecases/save_app_theme.dart';

class AppThemeCubit extends Cubit<String> {
  SaveAppTheme saveAppThemeUseCase;
  RetrieveAppTheme retrieveAppThemeUseCase;

  AppThemeCubit()
      : saveAppThemeUseCase = getIt(),
        retrieveAppThemeUseCase = getIt(),
        super(Constant.defaultTheme);

  retrieveAppThemeTrigger() {
    emit(retrieveAppThemeUseCase.call().fold((l) => Constant.defaultTheme, (r) => r));
  }

  saveAppThemeTrigger(String newAppTheme) async {
    emit((await saveAppThemeUseCase.call(newAppTheme)).fold((l) => newAppTheme, (r) => newAppTheme));
  }
}
