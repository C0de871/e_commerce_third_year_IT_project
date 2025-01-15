
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../features/auth/presentation/cubit/check_first_launch/check_first_launch_cubit.dart';
import '../../features/auth/presentation/cubit/get_last_user_cubit/get_last_user_cubit.dart';
import '../../features/auth/presentation/loading_screen/loading_screen.dart';
import '../../features/settings/presentation/cubit/language_cubit.dart';
import '../Routes/app_router.dart';
import '../helper/app_functions.dart';
import '../theme/app_theme.dart';
import '../translations/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        BlocProvider(
          create: (context) => LanguageCubit()..retrieveUserLang(),
        )
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          if (state is CurrentLanguage) {
            return MaterialApp(
              supportedLocales: L10n.all,
              navigatorObservers: [RouteObserverService()],
              locale: Locale(state.langCode),
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
              // initialRoute: AppRoutes.loginRoute,
              onGenerateRoute: AppRouter().generateRoute,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
