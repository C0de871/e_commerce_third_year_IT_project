import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/shared_prefs_helper.dart';
import 'package:e_commerce/core/utils/constants/constant.dart';

class SettingsDataSource {
  final SharedPrefsHelper sharedPrefsHelper;

  SettingsDataSource({required this.sharedPrefsHelper});

  String retrieveUserLang() {
    String? lang = sharedPrefsHelper.getData(key: CacheKey.userLang);

    if (lang == null) {
      return Constant.deviceLang;
    } else {
      return lang;
    }
  }

  Future<bool> saveUserLang(String lang) async {
    return await sharedPrefsHelper.saveData(key: CacheKey.userLang, value: lang);
  }

  String retrieveAppTheme() {
    String? theme = sharedPrefsHelper.getData(key: CacheKey.appTheme);
    if (theme == null) {
      return Constant.defaultTheme;
    }
    return theme;
  }
  
  Future<bool> saveAppTheme(String appTheme) async {
    return await sharedPrefsHelper.saveData(key: CacheKey.appTheme, value: appTheme);
  }
}
