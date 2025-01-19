import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/order/domain/usecases/delete_order.dart';
import 'package:e_commerce/features/order/presentation/order_cubit/delete_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteOrderCubit extends Cubit<DeleteOrderState> {
  DeleteOrder deleteOrder;
  DeleteOrderCubit()
      : deleteOrder = getIt<DeleteOrder>(),
        super(DeleteOrderInitial());

  dynamic deleteOrderTrigger({required String orderID}) async {
    GetOrderIdParams params = GetOrderIdParams(orderID: orderID);
    emit(DeleteOrderLoading());

    final failureOrDeleteOrderEntity = await deleteOrder.call(params: params);
    failureOrDeleteOrderEntity.fold(
      (failure) => emit(DeleteOrderFailure(errmessage: "no internet")),
      (messageEntity) {
        emit(DeleteOrderSuccess(messageEntity: messageEntity));
      },
    );
  }
}
