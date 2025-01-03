import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/Routes/app_routes.dart';
import 'package:e_commerce/core/helper/app_functions.dart';
import 'package:e_commerce/core/utils/constants/app_numbers.dart';
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
                  setState(() {
                    textEditingController.clear();
                  });
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
        final item = currentState.getAllProductsEntity.data!.products![indexOnPage];
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
          leading: CachedNetworkImage(
            imageUrl: item.mainImageUrl!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
            width: 48,
            height: 48,
          ),
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
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$${item.price!}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Quantity: ${item.quantity!}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ListTileSkeleton extends StatelessWidget {
  const ListTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Theme.of(context).colorScheme.surface;
    final highLightColor = Theme.of(context).colorScheme.surfaceContainerLow;
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highLightColor,
      child: ListTile(
        leading: SizedBox.square(
          dimension: 48,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: baseColor,
            ),
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: baseColor,
          ),
          width: MediaQuery.of(context).size.width * .7,
          height: 16,
        ),
        subtitle: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: baseColor,
          ),
          width: MediaQuery.of(context).size.width * .6,
          height: 16,
        ),
      ),
    );
  }
}
