import 'package:e_commerce/core/utils/services/service_locator.dart';
import '../../domain/usecases/get_order.dart';
import 'get_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrderCubit extends Cubit<GetOrderState> {
  GetOrder getOrder;
  GetOrderCubit()
      : getOrder = getIt<GetOrder>(),
        super(GetOrderInitial());
  dynamic getOrderTrigger() async {
    emit(GetOrderLoading());
    final failureOrOrderEntity = await getOrder.call();
    failureOrOrderEntity.fold(
      (failure) => emit(GetOrderFailure(errmessage: "no internet")),
      (orders) {
        emit(GetOrderSuccess(orders: orders));
      },
    );
  }
}
