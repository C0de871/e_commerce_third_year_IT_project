
import 'package:e_commerce/core/databases/cache/shared_prefs_helper.dart';
import 'package:e_commerce/core/utils/services/fire_base_service.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:flutter/material.dart';

import 'core/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  await getIt<SharedPrefsHelper>().init();
  await FireBaseService.initializeApp();
  await FireBaseService().initNotifications();
  
  runApp(const MyApp());
}
