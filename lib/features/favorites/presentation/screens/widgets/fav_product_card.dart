import 'package:e_commerce/features/favorites/domain/entities/get_fav_list_entity/fav_product_entity.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Routes/app_routes.dart';
import '../../../../../core/utils/constants/app_numbers.dart';
import '../../../../get_product_details/presentation/cubit/get_product_details_cubit.dart';
import '../../../../home/presentation/Home Screen/widgets/product_card.dart';

class FavProductCard extends StatelessWidget {
  const FavProductCard({
    super.key,
    required this.product,
  });

  final FavProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: (MediaQuery.sizeOf(context).width - padding4 * 8) / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      // width: MediaQuery.sizeOf(context).width / 2,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<GetProductDetailsCubit>().getProductDetailsTrigger(
                    productID: product.productId.toString(),
                    storeID: product.storeId.toString(),
                  );
              ProductEntity productModel = ProductEntity(
                storeId: product.storeId,
                productId: product.productId,
                storeName: product.storeName,
                productName: product.productName,
                mainImageUrl: product.mainImage,
                price: product.price,
                isFavorite: product.isFavorite,
                quantity: product.quantity,
                description: product.description,
                categoryId: product.categoryId,
                categoryName: product.categoryName,
              );
              Navigator.of(context).pushNamed(
                AppRoutes.productDetailsScreen,
                arguments: productModel,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(padding4 * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ProductImage(
                      mainImageUrl: product.mainImage!,
                      constraints: constraints,
                    ),
                  ),
                  const SizedBox(
                    height: padding4 * 4,
                  ),
                  ProductName(
                    productName: product.productName!,
                  ),
                  ProductStore(
                    storeName: product.storeName!,
                  ),
                  const SizedBox(height: padding4 * 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductPrice(
                        productPrice: product.price!,
                      ),
                      Faviourt(
                        isFav: product.isFavorite!,
                        productId: product.productId!,
                        storeId: product.storeId!,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
