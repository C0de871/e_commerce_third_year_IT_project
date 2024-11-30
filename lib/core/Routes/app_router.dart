import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import '../../features/user/presentation/sign up general info screen/sign_up_general_info_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUpGeneralInfoRoute:
        return MaterialPageRoute(builder: (_) => const SignUpGeneralInfoScreen());
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
