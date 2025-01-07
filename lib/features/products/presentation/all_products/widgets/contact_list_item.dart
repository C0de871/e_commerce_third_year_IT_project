import 'package:e_commerce/features/products/presentation/all_products/widgets/list_item_content.dart';
import 'package:e_commerce/features/products/presentation/all_products/widgets/list_tile_skeleton.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListItem extends StatelessWidget {
  const ContactListItem({
    required this.index,
    super.key,
    required this.productCubits,
    required this.querySearch,
  });
  final int index;
  final List<ProductCubit> productCubits;
  final String querySearch;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      key: ValueKey<String>('list_item_blocBuilder_$index'),
      buildWhen: (p, c) => p != c,
      builder: (context, state) {
        if (state is! GetAllProductsSuccess) {
          return const ListTileSkeleton();
        }
        final page = (index ~/ 20) + 1;
        final indexOnPage = index % 20;
        return BlocProvider.value(
          key: ValueKey<String>(
            'list_item_content_${page}_${indexOnPage}_blocProvider',
          ),
          value: productCubits[page - 1]
            ..getAllProducts(
              page: page,
              query: querySearch,
            ),
          child: ListItemContent(
            key: ValueKey<String>('list_item_content_${page}_$indexOnPage'),
            index: index,
            page: page,
            indexOnPage: indexOnPage,
          ),
        );
      },
    );
  }
}
