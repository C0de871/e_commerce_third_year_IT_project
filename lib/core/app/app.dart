
import 'package:e_commerce/features/user/presentation/cubit/check_first_launch/check_first_launch_cubit.dart';
import 'package:e_commerce/features/user/presentation/cubit/get_last_user_cubit/get_last_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:e_commerce/core/theme/app_theme.dart';

import '../../features/user/presentation/loading_screen/loading_screen.dart';
import '../Routes/app_router.dart';
import '../helper/app_functions.dart';
import '../translations/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetLastUserCubit(),
        ),
        BlocProvider(
          create: (context) => CheckFirstLaunchCubit(),
        ),
      ],
      child: MaterialApp(
        supportedLocales: L10n.all,
        navigatorObservers: [RouteObserverService()],
        locale: const Locale('en'),
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
        home: LoadingScreen(),
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
