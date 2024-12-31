import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/usecases/modify_cart.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModifyCartCubit extends Cubit<CartState>{
ModifyCart modifyCart;

  ModifyCartCubit() : 
  modifyCart =getIt<ModifyCart>(),
  super(CartInitial());

  dynamic modifyTrigger(Map<String,dynamic> modifiedItem) async {

    emit(ModifyLoading());

    final failureOrModifyCartEntity = await modifyCart.call(bodyJson:modifiedItem);

    failureOrModifyCartEntity.fold(
      (failure) => emit(ModifyFailure(errMessage: failure.errMessage)),
      (modifiedProducts) => emit(ModifySuccess(modifiedProducts: modifiedProducts)),
    );
  }
}

