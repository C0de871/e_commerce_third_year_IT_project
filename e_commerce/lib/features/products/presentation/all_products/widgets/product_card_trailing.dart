import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductCardTrailing extends StatelessWidget {
  const ProductCardTrailing({
    super.key,
    required this.item,
  });

  final ProductEntity item;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
