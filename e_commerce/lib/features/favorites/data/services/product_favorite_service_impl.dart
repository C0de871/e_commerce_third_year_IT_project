import 'dart:async';

import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/features/favorites/domain/service/product_favorite_service.dart';

class ProductFavoriteServiceImpl implements ProductFavoriteService {
  final _controller = StreamController<ProductFavoriteUpdate>.broadcast();

  @override
  Stream<ProductFavoriteUpdate> get favoriteUpdatesStream => _controller.stream;

  @override
  void updateProductFavoriteStatus(
      {required ToggleFavParams params, required int isFavorite}) {
    _controller.add(
      ProductFavoriteUpdate(
        params.productID,
        isFavorite,
        params.storeID,
      ),
    );
  }
}
