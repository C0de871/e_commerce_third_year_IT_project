import 'package:e_commerce/core/Routes/app_routes.dart';
import 'package:e_commerce/core/shared/screens/page_view_screen.dart';
import 'package:e_commerce/features/home/presentation/HomeCubit/home_cubit.dart';
import 'package:e_commerce/core/shared/screens/Navigation_cubit/navigation_bar_cubit.dart';
import 'package:e_commerce/features/product_details/presentation/product_details_screen.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:e_commerce/features/stores/presentation/cubit/store_cubit.dart';
import 'package:e_commerce/features/user/presentation/OTP/otp_screen.dart';
import 'package:e_commerce/features/user/presentation/cart_screen/cart_screen.dart';
import 'package:e_commerce/features/user/presentation/cubit/user_cubit.dart';
import 'package:e_commerce/features/user/presentation/login_screen/log_in_screen.dart';
import 'package:e_commerce/features/user/presentation/login_success_screen/login_success_screen.dart';
import 'package:e_commerce/features/user/presentation/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/favorites/presentation/cubit/toggle_fav_cubit.dart';
import '../../features/user/presentation/complete_profile_screen/complete_profile_screen.dart';
import '../../features/user/presentation/sign up auth screen/sign_up_auth_screen.dart';

class AppRouter {
  UserCubit? _userCubit;
  HomeCubit? _homeCubit;
  StoreCubit? _storeCubit;
  ProductCubit? _productCubit;
  NavigationBarCubit? _navBarCubit;
  ToggleFavCubit? _toggleFavOnCubit;

  UserCubit get userCubit {
    if (_userCubit == null || _userCubit!.isClosed) {
      _userCubit = UserCubit();
    }
    _userCubit!.stream.listen((_) {}, onDone: () {
      _userCubit = null; // Nullify the reference when closed
    });
    return _userCubit!;
  }

  NavigationBarCubit get navBarCubit {
    if (_navBarCubit == null || _navBarCubit!.isClosed) {
      _navBarCubit = NavigationBarCubit();
    }
    _navBarCubit!.stream.listen((_) {}, onDone: () {
      _navBarCubit = null; // Nullify the reference when closed
    });
    return _navBarCubit!;
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

  StoreCubit get storeCubit {
    if (_storeCubit == null || _storeCubit!.isClosed) {
      _storeCubit = StoreCubit();
    }
    _storeCubit!.stream.listen((_) {}, onDone: () {
      _storeCubit = StoreCubit();
    });
    return _storeCubit!;
  }

  HomeCubit get homeCubit {
    if (_homeCubit == null || _homeCubit!.isClosed) {
      _homeCubit = HomeCubit(
        productCubit: productCubit,
        storeCubit: storeCubit,
      );
    }
    _homeCubit!.stream.listen((_) {}, onDone: () {
      _homeCubit = null;
    });
    return _homeCubit!;
  }

  ToggleFavCubit get toggleFavOnCubit {
    if (_toggleFavOnCubit == null || _toggleFavOnCubit!.isClosed) {
      _toggleFavOnCubit = ToggleFavCubit();
    }
    _toggleFavOnCubit!.stream.listen((_) {}, onDone: () {
      _toggleFavOnCubit = null; // Nullify the reference when closed
    });
    return _toggleFavOnCubit!;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.cartScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: userCubit,
            child: const CartScreen(),
          ),
        );

      //!sign up auth route:
      case AppRoutes.signUpauthRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: userCubit,
            child: const SignUpAuthScreen(),
          ),
        );

      //!sign up complete profile route:
      case AppRoutes.signUpCompleteProfileRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: userCubit,
            child: const CompleteProfileScreen(),
          ),
        );

      //!otp route:
      case AppRoutes.otpRoute:
        return MaterialPageRoute(
          settings: settings,
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
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => userCubit,
            child: const LoginScreen(),
          ),
        );

      //! home route:
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => homeCubit,
              ),
              BlocProvider(
                create: (context) => productCubit,
              ),
              BlocProvider(
                create: (context) => storeCubit,
              ),
              BlocProvider(
                create: (context) => navBarCubit,
              ),
              BlocProvider(
                create: (context) => toggleFavOnCubit,
              )
            ],
            child: const PageViewScreen(),
          ),
        );

      //! product details route:
      case AppRoutes.productDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductDetailsScreen(),
        );

      //!default route:
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
