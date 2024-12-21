import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/features/home/presentation/Home%20Screen/home_screen.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:e_commerce/features/user/presentation/OTP/otp_screen.dart';
import 'package:e_commerce/features/user/presentation/cart_screen/cart_screen.dart';
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
  HomeCubit? _homeCubit;
  ProductCubit? _productCubit;

  UserCubit get userCubit {
    if (_userCubit == null || _userCubit!.isClosed) {
      _userCubit = UserCubit();
    }
    _userCubit!.stream.listen((_) {}, onDone: () {
      _userCubit = null; // Nullify the reference when closed
    });
    return _userCubit!;
  }

  ProductCubit get productCubit {
    if (_productCubit == null || _productCubit!.isClosed) {
      _productCubit = ProductCubit();
    }
    _productCubit!.stream.listen((_) {}, onDone: () {
      _productCubit = null;
    });
    return _productCubit!;
  }

  HomeCubit get homeCubit {
    if (_homeCubit == null || _homeCubit!.isClosed) {
      _homeCubit = HomeCubit(productCubit: productCubit);
    }
    _homeCubit!.stream.listen((_) {}, onDone: () {
      _homeCubit = null;
    });
    return _homeCubit!;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: userCubit,
            child: const CartScreen(),
          ),
        );

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

      //! home route:
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => homeCubit,
              ),
              BlocProvider(
                create: (context) => productCubit,
              ),
            ],
            child: const HomeScreen(),
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
