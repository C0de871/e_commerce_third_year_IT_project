import 'dart:developer';

import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/home/presentation/Home%20Screen/widgets/product_card.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../products/domain/entities/product_entity.dart';

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
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is GetAllProductsLoading) {
              return Row(
                children: [
                  ...List.generate(4, (index) {
                    return const ProductCardLoading();
                  })
                ],
              );
            }
            if (state is GetAllProductsSuccess) {
              List<ProductEntity>? products = state.getAllProductsEntity.data!.products!;

              log("rebuild the whole tree product fav is: ${products[0].isFavorite}");
              return Row(
                children: [
                  ...List.generate(products.length, (index) {
                    return Row(
                      children: [
                        ProductCard(
                          product: products[index],
                        ),
                        if (index != (products.length - 1)) const SizedBox(width: padding4 * 4),
                      ],
                    );
                  })
                ],
              );
            } else {
              return const Text("Failed To Load Data");
            }
          },
        ),
      ),
    );
  }
}
