import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/features/user/presentation/OTP/otp_screen.dart';
import 'package:e_commerce/features/user/presentation/cubit/user_cubit.dart';
import 'package:e_commerce/features/user/presentation/login_screen/logInScreen.dart';
import 'package:e_commerce/features/user/presentation/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/user/presentation/complete_profile_screen/complete_profile_screen.dart';
import '../../features/user/presentation/sign up auth screen/sign_up_auth_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUpauthRoute:
        return MaterialPageRoute(builder: (_) => const SignUpAuthScreen());
      case AppRoutes.signUpCompleteProfileRoute:
        String email = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => CompleteProfileScreen(
                  email: email,
                ));
      case AppRoutes.otpRoute:
        //todo final email = settings.arguments as String;
        String email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(
            email: email,
          ),
        );

      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => UserCubit(),
            child: const LoginScreen(),
          ),
        );

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
