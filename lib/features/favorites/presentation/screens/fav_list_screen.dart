import 'package:e_commerce/features/favorites/presentation/cubit/getFavList/get_fav_list_cubit.dart';
import 'package:e_commerce/features/favorites/presentation/screens/widgets/fav_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/Home Screen/widgets/product_card.dart';

class FavListScreen extends StatelessWidget {
  const FavListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorites"),
      ),
      body: BlocBuilder<GetFavListCubit, GetFavListState>(
        builder: (context, state) {
          if (state is GetFavListLoading) {
            return GridView.extent(
              maxCrossAxisExtent: 200, // Maximum width of each grid tile
              padding: const EdgeInsets.all(8),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.547,
              children: List.generate(
                20,
                (index) {
                  return ProductCardLoading();
                },
              ),
            );
          } else if (state is GetFavListSuccess) {
            return GridView.extent(
              maxCrossAxisExtent: 200, // Maximum width of each grid tile
              padding: const EdgeInsets.all(8),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.547,
              children: List.generate(
                state.getFavListEntity.data?.length ?? 0,
                (index) {
                  return FavProductCard(
                    product: state.getFavListEntity.data![index],
                  );
                },
              ),
            );
          } else {
            return Text("Failed");
          }
        },
      ),
    );
  }
}
