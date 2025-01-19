import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';
import 'package:e_commerce/features/check_out/domain/usecases/create_order.dart';
import 'package:e_commerce/features/check_out/presentation/check_cubit/check_out_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CreateOrder createOrder;

  CheckOutCubit()
      : createOrder = getIt<CreateOrder>(),
        super(CheckOutInitial());

  dynamic createOrderTrigger({required List<SubCartEntity> cartItems}) async {
    emit(CheckOutLoading());
    List<Map<String, dynamic>> jsonCartItems =
        cartItems.map((item) => item.toJson()).toList();

    // إنشاء هيكل الطلب
    Map<String, dynamic> bodyJson = {ApiKey.data: jsonCartItems};

    // print("********************${cartItems.length}");
    // Map<String,List<SubCartEntity>> bodyJson={'data' : cartItems};
    // print("----------------------------------------------");
    // print(bodyJson["data"][0]['quantity']);
    final failureOrCreateOrderEntity =
        await createOrder.call(bodyJson: bodyJson);
    failureOrCreateOrderEntity.fold(
      (failure) => emit(CheckOutFailure()),
      (checkOutOrderEntity) => emit(
        CheckOutSuccess(checkOutOrderEntity: checkOutOrderEntity),
      ),
    );
  }
}
