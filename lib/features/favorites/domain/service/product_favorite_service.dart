import 'package:e_commerce/core/databases/params/params.dart';

abstract class ProductFavoriteService {
  void updateProductFavoriteStatus({required ToggleFavParams params, required int isFavorite});
  Stream<ProductFavoriteUpdate> get favoriteUpdates;
}

//! class to store the id of the favorite that I want to update:
class ProductFavoriteUpdate {
  final String productId;
  final int isFavorite;
  final String storeID;

  ProductFavoriteUpdate(this.productId, this.isFavorite, this.storeID);
}
