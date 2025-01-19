import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/shared/widgets/my_place_holder.dart';
import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/get_store_details/presentation/cubit/show_store_cubit.dart';
import 'package:e_commerce/features/get_store_details/presentation/screens/widgets/store_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../home/presentation/Home Screen/widgets/product_card.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final storeID = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Store page"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(padding4 * 4),
              child: BlocBuilder<ShowStoreCubit, ShowStoreState>(
                builder: (context, state) {
                  if (state is ShowStoreSuccess) {
                    final store = state.storeDetails.data[0];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          foregroundImage: CachedNetworkImageProvider(
                            store.imageUrl,
                          ),
                          radius: 100,
                        ),
                        SizedBox(height: padding4 * 4),
                        Text(
                          store.name,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        SizedBox(height: padding4 * 2),
                        Text(
                          store.description,
                          style: TextStyle(
                            color: AppColors.myOnSurface,
                          ),
                        ),
                        SizedBox(height: padding4 * 6),
                      ],
                    );
                  } else if (state is ShowStoreFailed) {
                    return Center(child: Text("Failed"));
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ),
          BlocBuilder<ShowStoreCubit, ShowStoreState>(
            builder: (context, state) {
              if (state is ShowStoreLoading) {
                return SliverGrid.extent(
                  maxCrossAxisExtent: 200, // Maximum width of each grid tile
                  // padding: const EdgeInsets.all(8),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.547,
                  children: List.generate(
                    6,
                    (index) {
                      return ProductCardLoading();
                    },
                  ),
                );
              } else if (state is ShowStoreSuccess) {
                final store = state.storeDetails.data[0];
                return SliverPadding(
                  padding: EdgeInsets.all(padding4 * 4),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Maximum width of each grid tile
                      // padding: const EdgeInsets.all(8),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.66,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: store.products.length,
                      (context, index) {
                        final product = store.products[index];
                        return StoreProductCard(product: product);
                      },
                    ),
                  ),
                );
              } else {
                return Text("Failed");
              }
            },
          ),
        ],
      ),
    );
  }
}
