import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubit/user_cubit.dart';
import '../../features/auth/presentation/login_screen/log_in_screen.dart';
import '../../features/auth/presentation/login_success_screen/login_success_screen.dart';
import '../../features/auth/presentation/splash screen/splash_screen.dart';
import '../../features/products/presentation/add_product_cubit/add_product_cubit.dart';

import '../../dashboard.dart';
import '../../features/products/presentation/show_store_cubit/show_store_cubit.dart';
import 'app_routes.dart';

class AppRouter {
  //? <======= cubits declration =======>
  UserCubit? _userCubit;
  AddProductCubit? _addProductCubit;
  ShowStoreCubit? _showStoreCubit;

  UserCubit get userCubit {
    if (_userCubit == null || _userCubit!.isClosed) {
      _userCubit = UserCubit();
    }
    _userCubit!.stream.listen((_) {}, onDone: () {
      _userCubit = null;
    });
    return _userCubit!;
  }

  AddProductCubit get addProductCubit {
    if (_addProductCubit == null || _addProductCubit!.isClosed) {
      _addProductCubit = AddProductCubit();
    }
    _addProductCubit!.stream.listen((_) {}, onDone: () {
      _addProductCubit = null;
    });
    return _addProductCubit!;
  }

  ShowStoreCubit get showStoreCubit {
    if (_showStoreCubit == null || _showStoreCubit!.isClosed) {
      _showStoreCubit = ShowStoreCubit();
    }
    _showStoreCubit!.stream.listen((_) {}, onDone: () {
      _showStoreCubit = null;
    });
    return _showStoreCubit!;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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

      case AppRoutes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => addProductCubit,
              ),
              BlocProvider(
                create: (context) => showStoreCubit,
              ),
            ],
            child: const MainScreen(),
          ),
        );

      //!default route:
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                "No route defined for ${settings.name}",
              ),
            ),
          ),
        );
    }
  }
}
