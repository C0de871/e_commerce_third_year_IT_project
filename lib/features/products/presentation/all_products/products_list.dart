import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/Routes/app_routes.dart';
import 'package:e_commerce/core/helper/app_functions.dart';
import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/presentation/all_products/widgets/contact_list_item.dart';
import 'package:e_commerce/features/products/presentation/all_products/widgets/list_item_content.dart';
import 'package:e_commerce/features/products/presentation/all_products/widgets/list_tile_skeleton.dart';
import 'package:e_commerce/features/products/presentation/all_products/widgets/product_avatar.dart';
import 'package:e_commerce/features/products/presentation/all_products/widgets/product_card_trailing.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/shared/widgets/animated_search_field/animated_search_field.dart';
import '../../../get_product_details/presentation/cubit/get_product_details_cubit.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  TextEditingController textEditingController = TextEditingController();
  String querySearch = "";

  @override
  Widget build(BuildContext context) {
    List<ProductCubit>? productCubits;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Products"),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(padding: EdgeInsets.only(bottom: padding4 * 12)),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is GetAllProductsSuccess) {
                    productCubits = [
                      context.read<ProductCubit>(),
                      ...List.generate(
                        state.getAllProductsEntity.pagination!.totalPages! - 1,
                        (index) => ProductCubit(),
                      )
                    ];
                  }
                  return switch (state) {
                    ProductInitial() || GetAllProductsLoading() => SliverList.separated(
                        key: const Key('loading_listview'),
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return const ListTileSkeleton();
                        },
                        itemCount: 10,
                      ),
                    GetAllProductsSuccess() => SliverList.separated(
                        itemBuilder: (context, index) {
                          return ContactListItem(
                            querySearch: querySearch,
                            key: ValueKey<int>(index),
                            index: index,
                            productCubits: productCubits!,
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.getAllProductsEntity.pagination!.totalItems,
                        findChildIndexCallback: (key) {
                          final typedKey = key as ValueKey<int>;
                          return typedKey.value;
                        },
                      ),
                    GetAllProductsFailed() => const SliverToBoxAdapter(),
                  };
                },
              )
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padding4 * 4,
                vertical: padding4 * 2,
              ),
              child: AnimSearchBar(
                width: MediaQuery.sizeOf(context).width - padding4 * 8,
                color: Theme.of(context).colorScheme.primaryContainer,
                textFieldColor: Theme.of(context).colorScheme.surface,
                textController: textEditingController,
                onSuffixTap: () {
                  textEditingController.clear();
                  querySearch = "";
                  context.read<ProductCubit>().reset();
                  context.read<ProductCubit>().getAllProducts(query: "");
                },
                onSubmitted: (value) {
                  if (value.isEmpty) return;
                  querySearch = value;
                  context.read<ProductCubit>().reset();
                  context.read<ProductCubit>().getAllProducts(query: value);
                },
                helpText: "Search Products...",
                closeSearchOnSuffixTap: true,
                rtl: isRtl(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
