
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/databases/cache/shared_prefs_helper.dart';
import 'package:e_commerce/core/utils/constants/constant.dart';

class LangLocalDataSource {
  final SharedPrefsHelper sharedPrefsHelper;

  LangLocalDataSource({required this.sharedPrefsHelper});

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
}
