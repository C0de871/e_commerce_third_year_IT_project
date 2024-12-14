import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:e_commerce/core/theme/app_theme.dart';

import '../Routes/app_router.dart';
import '../constants/app_routes.dart';
import '../l10n/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: L10n.all,
      locale: const Locale('ar'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: AppTheme().theme(
        defaultLightScheme(),
      ),
      initialRoute: AppRoutes.homeRoute,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
