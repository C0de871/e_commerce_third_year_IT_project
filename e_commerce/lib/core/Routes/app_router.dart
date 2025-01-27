import 'package:e_commerce/features/get_store_details/presentation/cubit/show_store_cubit.dart';
import 'package:e_commerce/features/order/domain/entites/order_entity.dart';
import 'package:e_commerce/features/order/domain/entites/sub_order_entity.dart';
import 'package:e_commerce/features/order/presentation/order_cubit/delete_order_cubit.dart';
import 'package:e_commerce/features/order_details/presentation/order_details_cubit/get_order_details_cubit.dart';
import 'package:e_commerce/features/order_details/presentation/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/OTP/otp_screen.dart';
import '../../features/auth/presentation/cubit/user_cubit.dart';
import '../../features/auth/presentation/login_screen/log_in_screen.dart';
import '../../features/auth/presentation/login_success_screen/login_success_screen.dart';
import '../../features/auth/presentation/splash screen/splash_screen.dart';
import '../../features/cart/presentation/cart_screen/cart_screen.dart';
import '../../features/cart/presentation/cubit/add_to_cart_cubit.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/cart/presentation/cubit/delete_cart_cubit.dart';
import '../../features/cart/presentation/cubit/modify_cart_cubit.dart';
import '../../features/cart/presentation/cubit/size_cart_cubit.dart';
import '../../features/check_out/presentation/check_cubit/check_out_cubit.dart';
import '../../features/check_out/presentation/check_out_screen/check_out_screen.dart';
import '../../features/favorites/presentation/cubit/getFavList/get_fav_list_cubit.dart';
import '../../features/favorites/presentation/cubit/toggle_fav_cubit.dart';
import '../../features/favorites/presentation/screens/fav_list_screen.dart';
import '../../features/get_product_details/presentation/cubit/get_product_details_cubit.dart';
import '../../features/auth/presentation/complete_profile_screen/complete_profile_screen.dart';
import '../../features/auth/presentation/sign up auth screen/sign_up_auth_screen.dart';
import '../../features/get_product_details/presentation/screens/product_details_screen.dart';
import '../../features/get_store_details/presentation/screens/store_details_screen.dart';
import '../../features/home/presentation/HomeCubit/home_cubit.dart';
import '../../features/order/presentation/order_cubit/get_order_cubit.dart';
import '../../features/order/presentation/order_screen.dart';
import '../../features/products/presentation/all_products/products_list.dart';
import '../../features/products/presentation/cubit/product_cubit/product_cubit.dart';
import '../../features/stores/presentation/all_stores/stores_list.dart';
import '../../features/stores/presentation/cubit/store_cubit.dart';
import '../../features/user/presentation/account_details_screen.dart';
import '../shared/screens/Navigation_cubit/navigation_bar_cubit.dart';
import '../shared/screens/page_view_screen.dart';
import 'app_routes.dart';

class AppRouter {
  //? <======= cubits declration =======>
  UserCubit? _userCubit;
  HomeCubit? _homeCubit;
  StoreCubit? _storeCubit;
  ProductCubit? _productCubit;
  NavigationBarCubit? _navBarCubit;
  // ToggleFavCubit? _toggleFavOnCubit;
  CheckOutCubit? _checkOutCubit;
  //? <<======= cubits getter =======>>
  CartCubit? _cartCubit;
  ModifyCartCubit? _modifyCartCubit;
  DeleteCartCubit? _deleteCartCubit;
  SizeCartCubit? _sizeCartCubit;
  GetOrderCubit? _getOrderCubit;
  DeleteOrderCubit? _deleteOrderCubit;
  GetOrderDetailsCubit? _getOrderDetailsCubit;
  AddToCartCubit? _addToCartCubit;
  // ClearCartCubit? _clearCartCubit;

  UserCubit get userCubit {
    if (_userCubit == null || _userCubit!.isClosed) {
      _userCubit = UserCubit();
    }
    _userCubit!.stream.listen((_) {}, onDone: () {
      _userCubit = null; // Nullify the reference when closed
    });
    return _userCubit!;
  }

  AddToCartCubit get addToCartCubit {
    if (_addToCartCubit == null || _addToCartCubit!.isClosed) {
      _addToCartCubit = AddToCartCubit();
    }
    _addToCartCubit!.stream.listen((_) {}, onDone: () {
      _addToCartCubit = null; // Nullify the reference when closed
    });
    return _addToCartCubit!;
  }

  
  GetOrderCubit get getOrderCubit {
    if (_getOrderCubit == null || _getOrderCubit!.isClosed) {
      _getOrderCubit = GetOrderCubit();
      // log("cart created");
    }
    _getOrderCubit?.stream.listen((_) {}, onDone: () {
      _getOrderCubit = null; // Nullify the reference when closed
    });
    return _getOrderCubit!;
  }

  CartCubit get cartCubit {
    if (_cartCubit == null || _cartCubit!.isClosed) {
      _cartCubit = CartCubit();
      // log("cart created");
    }
    _cartCubit?.stream.listen((_) {}, onDone: () {
      _cartCubit = null; // Nullify the reference when closed
    });
    return _cartCubit!;
  }

  DeleteOrderCubit get deleteOrderCubit {
    if (_deleteOrderCubit == null || _deleteOrderCubit!.isClosed) {
      _deleteOrderCubit = DeleteOrderCubit();
      // log("cart created");
    }
    _deleteOrderCubit?.stream.listen((_) {}, onDone: () {
      _deleteOrderCubit = null; // Nullify the reference when closed
    });
    return _deleteOrderCubit!;
  }

  GetOrderDetailsCubit get getOrderDetailsCubit {
    if (_getOrderDetailsCubit == null || _getOrderDetailsCubit!.isClosed) {
      _getOrderDetailsCubit = GetOrderDetailsCubit();
      // log("cart created");
    }
    _getOrderDetailsCubit?.stream.listen((_) {}, onDone: () {
      _getOrderDetailsCubit = null; // Nullify the reference when closed
    });
    return _getOrderDetailsCubit!;
  }

  ModifyCartCubit get modifyCartCubit {
    if (_modifyCartCubit == null || _modifyCartCubit!.isClosed) {
      _modifyCartCubit = ModifyCartCubit();
    }
    _modifyCartCubit?.stream.listen((_) {}, onDone: () {
      _modifyCartCubit = null; // Nullify the reference when closed
    });
    return _modifyCartCubit!;
  }

  DeleteCartCubit get deleteCartCubit {
    if (_deleteCartCubit == null || _deleteCartCubit!.isClosed) {
      _deleteCartCubit = DeleteCartCubit();
    }
    _deleteCartCubit?.stream.listen((_) {}, onDone: () {
      _deleteCartCubit = null; // Nullify the reference when closed
    });
    return _deleteCartCubit!;
  }

  SizeCartCubit get sizeCartCubit {
    if (_sizeCartCubit == null || _sizeCartCubit!.isClosed) {
      _sizeCartCubit = SizeCartCubit();
    }
    _sizeCartCubit?.stream.listen((_) {}, onDone: () {
      _sizeCartCubit = null; // Nullify the reference when closed
    });
    return _sizeCartCubit!;
  }

  CheckOutCubit get checkOutCubit {
    if (_checkOutCubit == null || _checkOutCubit!.isClosed) {
      _checkOutCubit = CheckOutCubit();
    }
    _checkOutCubit?.stream.listen((_) {}, onDone: () {
      _checkOutCubit = null; // Nullify the reference when closed
    });
    return _checkOutCubit!;
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
        cartCubit: cartCubit,
        productCubit: productCubit,
        storeCubit: storeCubit,
      );
    }
    _homeCubit!.stream.listen((_) {}, onDone: () {
      _homeCubit = null;
    });
    return _homeCubit!;
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //! cart route:
      case AppRoutes.cartScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => modifyCartCubit,
              ),
              BlocProvider(
                create: (context) => cartCubit..getCartTrigger(),
              ),
              BlocProvider(
                create: (context) => deleteCartCubit,
              ),
              // BlocProvider(
              //   create: (context) => clearCartCubit,
              // ),
            ],
            child: const CartScreen(),
          ),
        );
      //     builder:
      //   create: (context) => userCubit,
      //   child: const LoginScreen(),
      // ),
      //   builder: (_) => MultiBlocProvider(providers: [
      //         BlocProvider.value(value: cartCubit),

      //       ], child: const CartScreen()));
//!order screen:
            case AppRoutes.orderScreen:
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => getOrderCubit..getOrderTrigger(),
                  ),
                  BlocProvider(
                    create: (context) => deleteOrderCubit,
                  ),
                  BlocProvider(
                    create: (context) => getOrderDetailsCubit,
                  ),
                ], child: const OrderScreen()));
//!check out screen :
      case AppRoutes.checkOutScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => checkOutCubit,
            child: const CheckOutScreen(),
          ),
        );

      case AppRoutes.orderDetailsRoute:
        final order = settings.arguments as SubOrderEntity;
        final id=order.id.toString();
        debugPrint(
            "Navigating to ${AppRoutes.orderDetailsRoute} with ID: ${id}");
        return MaterialPageRoute(
          
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) =>
                getOrderDetailsCubit..getOrderDetailsTrigger(orderID: id),
            child: const OrderDetailsScreen(),
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

      case AppRoutes.favoritesRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => GetProductDetailsCubit.instance),
              BlocProvider(create: (context) => ToggleFavCubit.instance),
              BlocProvider(create: (context) => GetFavListCubit.instance..getFavList()),
            ],
            child: FavListScreen(),
          ),
        );

      case AppRoutes.accountDetails:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AccountDetailsScreen(),
        );

      //! home route:
      case AppRoutes.pageView:
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
                create: (context) => cartCubit,
              ),
              BlocProvider(
                create: (context) => sizeCartCubit,
              )
            ],
            child: const PageViewScreen(),
          ),
        );

      //! product details route:
      case AppRoutes.productDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: GetProductDetailsCubit.instance,
              ),
              BlocProvider.value(
                value: ToggleFavCubit.instance,
              ),
              BlocProvider.value(
                value: addToCartCubit,
              ),
              BlocProvider(
                create: (context) => modifyCartCubit,
              ),
            ],
            child: ProductDetailsScreen(),
          ),
        );

      //! all products screen:
      case AppRoutes.seeMoreProductsRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProductCubit()..getAllProducts(),
              ),
              BlocProvider.value(
                value: GetProductDetailsCubit.instance,
              )
            ],
            child: ProductsList(),
          ),
        );

      //! all products screen:
      case AppRoutes.seeMoreStoresRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => StoreCubit()..getAllStores(),
              ),
            ],
            child: StoreList(),
          ),
        );

      case AppRoutes.storeDetailsRoute:
        final storeID = settings.arguments as String;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => GetProductDetailsCubit.instance),
                BlocProvider(create: (context) => ToggleFavCubit.instance),
                BlocProvider(
                    create: (context) =>
                        ShowStoreCubit()..showStoreTrigger(storeID: storeID)),
              ],
              child: const StoreDetailsScreen(),
            );
          },
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
