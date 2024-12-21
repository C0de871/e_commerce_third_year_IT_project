import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/home/presentation/Home%20Screen/widgets/product_card.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit.dart';
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is GetAllProductsLoading) {
              return Row(
                children: [
                  ...List.generate(4, (index) {
                    return const ProductCard();
                  })
                ],
              );
            }
            if (state is GetAllProductsSuccess) {
              return Row(
                children: [
                  ...List.generate(4, (index) {
                    return ProductCard(
                      product: state.productsList[index],
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
