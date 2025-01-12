import 'dart:developer';

import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/home/presentation/Home%20Screen/widgets/product_card.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PopularProductList extends StatelessWidget {
  const PopularProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: padding4 * 4,
      ),
      child: SizedBox(
        height: 311, // Adjust height based on your ProductCard dimensions
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is GetAllProductsLoading) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index != 3 ? padding4 * 4 : 0,
                    ),
                    child: const ProductCardLoading(),
                  );
                },
              );
            }
            if (state is GetAllProductsSuccess) {
              final products = state.getAllProductsEntity.data!.products!;
              log("Rebuild the whole tree. Product favorite status is: ${products[0].isFavorite}");
              return ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: padding4 * 1,
                  vertical: padding4 * 1,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index != (products.length - 1) ? padding4 * 4 : 0,
                    ),
                    child: ProductCard(
                      product: products[index],
                    ),
                  );
                },
              );
            }
            return const Center(
              child: Text("Failed to load data"),
            );
          },
        ),
      ),
    );
  }
}
