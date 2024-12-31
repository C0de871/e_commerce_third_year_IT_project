import 'package:e_commerce/core/Routes/app_router.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/cart/data/models/cart.dart';
import 'package:e_commerce/features/cart/data/models/sub_cart/sub_cart_model.dart';
import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCard extends StatelessWidget {
  CartItemCard({super.key, required this.cartItem});
  final SubCartEntity cartItem;
  final bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: padding4 * 22,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(padding4 * 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(padding4 * 4),
                  color: Theme.of(context).colorScheme.surfaceBright),
              child: Image.network("${cartItem.mainImage}"),
            ),
          ),
        ),
        SizedBox(
          width: padding4 * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${cartItem.productName}",
              maxLines: 2,
              //TODO style of product size 16
            ),
            SizedBox(
              height: padding4 * 2,
            ),
            Text.rich(TextSpan(
                    text: "\$${cartItem.price}",
                    //TODO style fontwieght w600 + color
                    children: [TextSpan(text: " x${cartItem.quantity} ")])
                //ToDo Style + cart.product.price
                //ToDo style for number of items

                )
          ],
        ),
        Spacer(
          flex: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.read<CartCubit>().decrement(
                      cartItem.productId ?? 0, cartItem.storeId ?? 0);
                },
                icon: Icon(Icons.remove)),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartSuccess) {
                  final subCartItem = state.cart.data!.firstWhere(
                    (item) =>
                        item.productId == cartItem.productId &&
                        item.storeId == cartItem.storeId,
                    orElse: () => cartItem,
                  );

                  return Text("Quantity: ${subCartItem.quantity ?? 0}");
                }

                return Center(child: Text("Loading..."));
              },
            ),
            IconButton(
                onPressed: () {
                  context.read<CartCubit>().increment(
                      cartItem.productId ?? 0, cartItem.storeId ?? 0);
                },
                icon: Icon(Icons.add)),
          ],
        ),
        Spacer(flex: 1),
        Icon(
          Icons.favorite,
          color: fav ? Colors.red : Colors.grey,
        ),
      ],
    );
  }
}
