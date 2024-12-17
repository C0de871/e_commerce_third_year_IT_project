import 'package:e_commerce/core/databases/cache/cache_helper.dart';
import 'package:e_commerce/core/services/fire_base_service.dart';
import 'package:e_commerce/core/services/service_locator.dart';
import 'package:flutter/material.dart';

import 'core/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  await getIt<CacheHelper>().init();
  await FireBaseService.initializeApp();
  await FireBaseService().initNotifications();
  runApp(const MyApp());
}