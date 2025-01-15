// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:e_commerce/features/products/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:e_commerce/features/stores/presentation/cubit/store_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProductCubit productCubit;
  StoreCubit storeCubit;
  CartCubit cartCubit;

  HomeCubit({
    required this.productCubit,
    required this.storeCubit,
    required this.cartCubit,
  }) : super(HomeInitial());

  dynamic getHomeData({int productPage = 1, int storePage = 1}) async {
    await Future.wait<dynamic>([
      productCubit.getAllProducts(page: productPage),
      storeCubit.getAllStores(page: storePage),
      //get
    ]);
  }
}
