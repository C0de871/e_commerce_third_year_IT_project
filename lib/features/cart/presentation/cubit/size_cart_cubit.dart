import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_size_cart.dart';
import 'package:e_commerce/features/cart/presentation/cubit/size_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeCartCubit extends Cubit<SizeCartState>{
GetSizeCart getSizeCart;

  SizeCartCubit()
  : getSizeCart=getIt<GetSizeCart>(),
  super(SizeInitial());

dynamic getSizeCartTrigger() async {
    emit(SizeLoading());
    final failureOrSizeEntity = await getSizeCart.call();
    failureOrSizeEntity.fold(
      (failure) => emit(SizeFailure(errMessage: failure.errMessage)),
      (sizeCartEntity) => emit(
        SizeSuccess(sizeCartEntity: sizeCartEntity),
      ),
    );
  }

}


