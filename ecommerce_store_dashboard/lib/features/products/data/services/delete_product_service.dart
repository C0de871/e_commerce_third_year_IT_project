import 'dart:async';

class DeleteProductService {
  static final DeleteProductService _instance = DeleteProductService._internal();
  factory DeleteProductService() => _instance;
  DeleteProductService._internal();

  final _productDeleteController = StreamController<DeleteProductEvent>.broadcast();

  Stream<DeleteProductEvent> get productDeleteStream => _productDeleteController.stream;

  void notifyProductDelete(int storeId, int productId) {
    _productDeleteController.add(DeleteProductEvent(storeId: storeId, productId: productId));
  }

  void dispose() {
    _productDeleteController.close();
  }
}

class DeleteProductEvent {
  final int storeId;
  final int productId;

  DeleteProductEvent({required this.storeId, required this.productId});
}
