import 'dart:async';

import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';

class ModifyCartService {
  ModifyCartService();

  final _controller = StreamController<SubCartEntity>.broadcast();

  Stream<SubCartEntity> get modifyUpdatesStream => _controller.stream;
//add to stream
  void modifyCartProducts({required SubCartEntity subCartEntity}) {
    print("in stream: ${subCartEntity.quantity}");
    _controller.add(subCartEntity);
  }
}

class ModifyCartUpdate {
  final String productId;
  final String storeId;
  final String amount;
  final String message;

  ModifyCartUpdate(
      {required this.productId,
      required this.storeId,
      required this.amount,
      required this.message});
}
