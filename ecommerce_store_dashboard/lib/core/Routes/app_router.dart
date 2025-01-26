import 'package:ecommerce_store_dashboard/features/order_dash/presentation/cubit/get_order_dash_cubit.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/presentation/order_screen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubit/user_cubit.dart';
import '../../features/auth/presentation/login_screen/log_in_screen.dart';
import '../../features/auth/presentation/login_success_screen/login_success_screen.dart';
import '../../features/auth/presentation/splash screen/splash_screen.dart';

import '../../features/products/presentation/cubit/add_product_cubit.dart';
import '../../dashboard.dart';
import 'app_routes.dart';

class AppRouter {
  //? <======= cubits declration =======>
  UserCubit? _userCubit;
  AddProductCubit? _addProductCubit;
  GetOrderDashCubit? _getOrderDashCubit;

  UserCubit get userCubit {
    if (_userCubit == null || _userCubit!.isClosed) {
      _userCubit = UserCubit();
    }
    _userCubit!.stream.listen((_) {}, onDone: () {
      _userCubit = null; // Nullify the reference when closed
    });
    return _userCubit!;
  }

  AddProductCubit get addProductCubit {
    if (_addProductCubit == null || _addProductCubit!.isClosed) {
      _addProductCubit = AddProductCubit();
    }
    _addProductCubit!.stream.listen((_) {}, onDone: () {
      _addProductCubit = null; // Nullify the reference when closed
    });
    return _addProductCubit!;
  }

GetOrderDashCubit get getOrderDashCubit {
    if (_getOrderDashCubit == null || _getOrderDashCubit!.isClosed) {
      _getOrderDashCubit = GetOrderDashCubit();
    }
    _getOrderDashCubit!.stream.listen((_) {}, onDone: () {
      _getOrderDashCubit = null; // Nullify the reference when closed
    });
    return _getOrderDashCubit!;
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

      case AppRoutes.addProducts:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => addProductCubit,
            child: const MainScreen(),
          ),
        );

case AppRoutes.order:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getOrderDashCubit..getOrderDashTrigger(),
            child: const OrderScreen(),
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
