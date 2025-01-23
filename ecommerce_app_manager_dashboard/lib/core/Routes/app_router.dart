import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubit/user_cubit.dart';
import '../../features/auth/presentation/login_screen/log_in_screen.dart';
import '../../features/auth/presentation/login_success_screen/login_success_screen.dart';
import '../../features/auth/presentation/splash screen/splash_screen.dart';
import '../../features/users/presentation/cubit/get_users_cubit.dart';
import '../../features/users/presentation/dashboard.dart';
import '../../features/users/presentation/update_role_cubit/update_user_role_cubit.dart';
import 'app_routes.dart';

class AppRouter {
  //? <======= cubits declration =======>
  UserCubit? _userCubit;
  GetUsersCubit? _getUsersCubit;
  UpdateUserRoleCubit? _updateUserRoleCubit;

  UserCubit get userCubit {
    if (_userCubit == null || _userCubit!.isClosed) {
      _userCubit = UserCubit();
    }
    _userCubit!.stream.listen((_) {}, onDone: () {
      _userCubit = null; // Nullify the reference when closed
    });
    return _userCubit!;
  }

  GetUsersCubit get getUsersCubit {
    if (_getUsersCubit == null || _getUsersCubit!.isClosed) {
      _getUsersCubit = GetUsersCubit();
    }
    _getUsersCubit!.stream.listen((_) {}, onDone: () {
      _getUsersCubit = null; // Nullify the reference when closed
    });
    return _getUsersCubit!;
  }

  UpdateUserRoleCubit get updateUserRoleCubit {
    if (_updateUserRoleCubit == null || _updateUserRoleCubit!.isClosed) {
      _updateUserRoleCubit = UpdateUserRoleCubit();
    }
    _updateUserRoleCubit!.stream.listen((_) {}, onDone: () {
      _updateUserRoleCubit = null; // Nullify the reference when closed
    });
    return _updateUserRoleCubit!;
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

      case AppRoutes.usersRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getUsersCubit..getUsersTrigger(),
              ),
              BlocProvider(
                create: (context) => updateUserRoleCubit,
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
