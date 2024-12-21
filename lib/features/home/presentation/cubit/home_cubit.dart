import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProductCubit productCubit;

  HomeCubit({required this.productCubit}) : super(HomeInitial());

  dynamic getHomeData({int page = 1}) async {
    await productCubit.getAllProducts(page: page);
  }
}
