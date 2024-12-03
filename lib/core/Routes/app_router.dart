import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/features/user/presentation/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen :
      return MaterialPageRoute(builder: (_)=> SplashScreen());
      // case AppRoutes.signUpGeneralInfoRoute:
      //   return MaterialPageRoute(builder: (_) => const SignUpGeneralInfoScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
