import 'dart:developer';

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/utils/services/service_locator.dart';
import 'package:e_commerce/features/cart/data/serevice/modify_cart_service.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';
import 'package:e_commerce/features/cart/domain/entites/modify_cart/modify_cart.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/usecases/modify_cart.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/modify_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModifyCartCubit extends Cubit<ModifyCartState> {
  ModifyCart modifyCart;
  ModifyCartService modifyCartService;
  List<Map<String, dynamic>> modifiedItems = [];

  ModifyCartCubit()
      : modifyCart = getIt<ModifyCart>(),
        modifyCartService = getIt<ModifyCartService>(),
        super(ModifyCartInitial());
//! increment function:
  void increment(SubCartEntity subCartEntity) {
    if (subCartEntity.orderQuantity == subCartEntity.quantity) {
      return;
    }
    final modifiedItem = {
      ApiKey.productId: subCartEntity.productId,
      ApiKey.storeId: subCartEntity.storeId,
      ApiKey.quantity: subCartEntity.orderQuantity! + 1,
    };
    final existingIndex = modifiedItems.indexWhere(
      (item) => item[ApiKey.productId] == subCartEntity.productId && item[ApiKey.storeId] == subCartEntity.storeId,
    );
    if (existingIndex == -1) {
      modifiedItems.add(modifiedItem);
    } else {
      modifiedItems[existingIndex] = modifiedItem;
    }

    final SubCartEntity updatedSubCartEntity = subCartEntity.copyWith(orderQuantity: subCartEntity.orderQuantity! + 1);
    print("in increment:${updatedSubCartEntity.orderQuantity}");
    modifyCartService.modifyCartProducts(subCartEntity: updatedSubCartEntity);
  }

//! decrement function:
  void decrement(SubCartEntity subCartEntity) {
    if (subCartEntity.orderQuantity == 1) {
      return;
    }
    final modifiedItem = {
      ApiKey.productId: subCartEntity.productId,
      ApiKey.storeId: subCartEntity.storeId,
      ApiKey.quantity: subCartEntity.orderQuantity! - 1,
    };
    final existingIndex = modifiedItems.indexWhere(
      (item) => item[ApiKey.productId] == subCartEntity.productId && item[ApiKey.storeId] == subCartEntity.storeId,
    );
    if (existingIndex == -1) {
      modifiedItems.add(modifiedItem);
    } else {
      modifiedItems[existingIndex] = modifiedItem;
    }
    final SubCartEntity updatedSubCartEntity = subCartEntity.copyWith(orderQuantity: subCartEntity.orderQuantity! - 1);
    modifyCartService.modifyCartProducts(subCartEntity: updatedSubCartEntity);
    }

    dynamic modifyTrigger() async {
      emit(ModifyLoading());

      final failureOrModifyCartEntity = await modifyCart.call(bodyJson: {'data': modifiedItems});
      failureOrModifyCartEntity.fold(
        (failure) => emit(ModifyFailure(errMessage: failure.errMessage)),
        (modifiedProducts) => emit(ModifySuccess(cart: modifiedProducts)),
      );
  }
}
