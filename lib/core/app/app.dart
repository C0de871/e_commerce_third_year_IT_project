
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../Routes/app_router.dart';
import '../constants/app_routes.dart';
import '../theme/theme_manager.dart';

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: AppTheme.lightTheme,
      themeMode: _themeManager.themeMode,
      initialRoute: AppRoutes.signUpGeneralInfoRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}