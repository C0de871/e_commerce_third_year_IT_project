import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/features/product/presentation/cubit/counter_cubit.dart';
import 'package:e_commerce/features/user/presentation/OTP/otp_screen.dart';
import 'package:e_commerce/features/product/presentation/cart_screen/cart_screen.dart';
import 'package:e_commerce/features/user/presentation/cubit/user_cubit.dart';
import 'package:e_commerce/features/user/presentation/login_screen/logInScreen.dart';
import 'package:e_commerce/features/user/presentation/login_success_screen/login_success_screen.dart';
import 'package:e_commerce/features/user/presentation/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/user/presentation/complete_profile_screen/complete_profile_screen.dart';
import '../../features/user/presentation/sign up auth screen/sign_up_auth_screen.dart';

class AppRouter {
  UserCubit? _userCubit;
  CounterCubit? _counterCubit;

  UserCubit get userCubit {
    if (_userCubit == null || _userCubit!.isClosed) {
      _userCubit = UserCubit();
    }
    _userCubit?.stream.listen((_) {}, onDone: () {
      _userCubit = null; // Nullify the reference when closed
    });
    return _userCubit!;
  }

  CounterCubit get counterCubit {
    if (_counterCubit == null || _counterCubit!.isClosed) {
      _counterCubit = CounterCubit();
    }
    _counterCubit?.stream.listen((_) {}, onDone: () {
      _counterCubit = null; // Nullify the reference when closed
    });
    return _counterCubit!;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // //!cart route
      // case AppRoutes.cartScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => MultiBlocProvider(providers: [
      //             BlocProvider.value(value: userCubit),
      //             BlocProvider.value(value: counterCubit),
      //           ], child: const CartScreen()));

       //!sign up auth route:
      case AppRoutes.signUpauthRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: userCubit,
            child: const SignUpAuthScreen(),
          ),
        );

      //!sign up complete profile route:
      case AppRoutes.signUpCompleteProfileRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: userCubit,
            child: const CompleteProfileScreen(),
          ),
        );

      //!otp route:
      case AppRoutes.otpRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: userCubit,
            child: const OtpScreen(),
          ),
        );

      //!splash route:
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      //!login success route:
      case AppRoutes.loginSuccessRoute:
        return MaterialPageRoute(builder: (_) => const LoginSuccessScreen());

      //!login route:
      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => userCubit,
            child: const LoginScreen(),
          ),
        );

      //!default route:
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
