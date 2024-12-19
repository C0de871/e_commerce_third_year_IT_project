import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/features/home/presentation/Home%20Screen/widgets/product_card.dart';
import 'package:flutter/material.dart';

class PopularProductList extends StatelessWidget {
  const PopularProductList({
    super.key,
    required this.fetchingProductState,
  });

  final FetchProductState fetchingProductState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: padding4 * 4,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        scrollDirection: Axis.horizontal,
        //todo: remove every fetchingproduct state:
        child: Row(
          children: [
            ProductCard(fetchProductState: fetchingProductState),
            const SizedBox(
              width: padding4 * 4,
            ),
            ProductCard(fetchProductState: fetchingProductState),
            const SizedBox(
              width: padding4 * 4,
            ),
            ProductCard(fetchProductState: fetchingProductState),
          ],
        ),
      ),
    );
  }
}
