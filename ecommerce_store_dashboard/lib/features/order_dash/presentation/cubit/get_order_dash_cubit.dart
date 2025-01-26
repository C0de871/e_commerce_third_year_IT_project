import 'package:ecommerce_store_dashboard/core/utils/services/service_locator.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/domain/order%20use_cases/get_order_dash.dart';
import 'package:ecommerce_store_dashboard/features/order_dash/presentation/cubit/get_order_dash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrderDashCubit extends Cubit<GetOrderDashState> {
  GetOrderDash getOrderDash;
  GetOrderDashCubit()
      : getOrderDash = getIt<GetOrderDash>(),
        super(GetOrderDashInitial());
  dynamic getOrderDashTrigger() async {
    emit(GetOrderDashLoading());
    final failureOrOrderEntity = await getOrderDash.call();
    failureOrOrderEntity.fold(
      (failure) => emit(GetOrderDashFailure(errmessage: "no internet")),
      (orders) {
        emit(GetOrderDashSuccess(orders: orders));
      },
    );
  }
}