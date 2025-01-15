import 'package:e_commerce/core/Routes/app_routes.dart';
import 'package:e_commerce/features/get_product_details/presentation/cubit/get_product_details_cubit.dart';
import 'package:e_commerce/features/products/presentation/all_products/widgets/list_tile_skeleton.dart';
import 'package:e_commerce/features/products/presentation/all_products/widgets/product_avatar.dart';
import 'package:e_commerce/features/products/presentation/all_products/widgets/product_card_trailing.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListItemContent extends StatelessWidget {
  const ListItemContent({
    required this.index,
    required this.page,
    required this.indexOnPage,
    super.key,
  });
  final int index;
  final int page;
  final int indexOnPage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      key: ValueKey<String>(
        'list_item_content_${page}_${indexOnPage}_blocBuilder',
      ),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is! GetAllProductsSuccess) {
          return const ListTileSkeleton();
        }
        final currentState = state;
        final item =
            currentState.getAllProductsEntity.data!.products![indexOnPage];
        return ListTile(
          key: ValueKey<int>(index),
          onTap: () {
            context.read<GetProductDetailsCubit>().getProductDetailsTrigger(
                  productID: item.productId.toString(),
                  storeID: item.storeId.toString(),
                );
            Navigator.of(context).pushNamed(
              AppRoutes.productDetailsScreen,
              arguments: item,
            );
          },
          leading: ProductAvatar(item: item),
          title: Text(
            item.productName!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            item.storeName!,
            maxLines: 1,
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
          enabled: true,
          trailing: ProductCardTrailing(item: item),
        );
      },
    );
  }
}
