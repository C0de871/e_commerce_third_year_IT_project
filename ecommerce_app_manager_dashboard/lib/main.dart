
import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/databases/cache/shared_prefs_helper.dart';
import 'core/utils/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  await getIt<SharedPrefsHelper>().init();
  // await FireBaseService.initializeApp();
  // await FireBaseService().initNotifications();
  runApp(const MyApp());
}
