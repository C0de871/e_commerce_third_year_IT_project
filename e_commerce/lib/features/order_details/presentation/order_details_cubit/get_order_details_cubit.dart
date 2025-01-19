import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/order_details/domain/usecases/get_order_details.dart';
import 'package:e_commerce/features/order_details/presentation/order_details_cubit/get_order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrderDetailsCubit extends Cubit<GetOrderDetailsState> {
  GetOrderDetails getOrderDetails;
  GetOrderDetailsCubit()
      : getOrderDetails = getIt<GetOrderDetails>(),
        super(GetOrderDetailsInitial());

  dynamic getOrderDetailsTrigger({required String orderID}) async {
    GetOrderIdParams params = GetOrderIdParams(orderID: orderID);
    emit(GetOrderDetailsLoading());

    final failureOrDeleteOrderEntity = await getOrderDetails.call(params: params);
    failureOrDeleteOrderEntity.fold(
      (failure) => emit(GetOrderDetailsFailure(errmessage: "no internet")),
      (orderDetailsEntity) {
        emit(GetOrderDetailsSuccess(orderDetailsEntity: orderDetailsEntity));
      },
    );
  }
}
