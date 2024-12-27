import 'package:e_commerce/core/Routes/app_router.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/features/product/data/models/cart.dart';
import 'package:e_commerce/features/product/presentation/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCard extends StatelessWidget {
  final bool fav = false;
  final int index;
  CartItemCard({super.key, required this.cart, required this.index});
  final ProductData cart;
  // int counter=0;
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
              child: Image.asset(cart.product.image),
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
              cart.product.title,
              maxLines: 2,
              //TODO style of product size 16
            ),
            SizedBox(
              height: padding4 * 2,
            ),
            Text.rich(TextSpan(
                    text: "\$${cart.product.price}",
                    //TODO style fontwieght w600 + color
                    children: [TextSpan(text: " x${cart.numOfItems} ")])
                //ToDo Style + cart.product.price
                //ToDo style for number of items

                )
          ],
        ),
        Spacer(
          flex: 10,
        ),
        BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    icon: Icon(Icons.add)),
                Text("${state}"),
                IconButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    icon: Icon(Icons.remove)),
              ],
            );
          },
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
