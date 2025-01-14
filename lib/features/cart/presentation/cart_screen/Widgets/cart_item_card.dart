
import 'package:e_commerce/features/cart/domain/entites/cart_entity/sub_cart_entity.dart';
import 'package:e_commerce/features/cart/presentation/cubit/modify_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartItem});
  final SubCartEntity cartItem;
  final bool fav = false;
  final message = "not available now";
  @override
  Widget build(BuildContext context) {
    print("##############################${cartItem.mainImage}");
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 80,
                height: 120,
                color: Colors.grey.shade200,
                child: Image.network(
                  "${cartItem.mainImage}",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${cartItem.productName}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${cartItem.price}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "${cartItem.message}",
                          style: TextStyle(
                            fontSize: 14,
                            color: cartItem.message == "Not available for now"
                                ? Colors.red
                                : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // قسم الأزرار
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 8.0), // إبعاد الأزرار عن الحافة
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<ModifyCartCubit>().decrement(cartItem);
                          },
                          icon: const Icon(Icons.remove),
                          color: Colors.orange,
                          iconSize: 20, 
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Colors
                                .white), 
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: Colors.orange, width: 2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        
                        Text(
                          "${cartItem.orderQuantity ?? 0}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        
                        IconButton(
                          onPressed: () {
                            context.read<ModifyCartCubit>().increment(cartItem);
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.orange,
                          iconSize: 20, 
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Colors
                                .white), 
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: Colors.orange, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// return Row(
//       children: [
//         SizedBox(
//           width: padding4 * 22,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: EdgeInsets.all(padding4 * 2),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(padding4 * 4),
//                   color: Theme.of(context).colorScheme.surfaceBright),
//               child: Image.network("${cartItem.mainImage}"),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: padding4 * 5,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "${cartItem.productName}",
//               maxLines: 2,
//               //TODO style of product size 16
//             ),
//             SizedBox(
//               height: padding4 * 2,
//             ),
//             Text.rich(TextSpan(
//                     text: "\$${cartItem.price}",
//                     //TODO style fontwieght w600 + color
//                     children: [TextSpan(text: " x${cartItem.quantity} ")])
//                 //ToDo Style + cart.product.price
//                 //ToDo style for number of items

//                 )
//           ],
//         ),
//         Spacer(
//           flex: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//                 onPressed: () {
//                   context.read<ModifyCartCubit>().decrement(cartItem);
//                 },
//                 icon: Icon(Icons.remove)),
//             Text("${cartItem.orderQuantity ?? 0}"),
//             IconButton(
//                 onPressed: () {
//                   context.read<ModifyCartCubit>().increment(cartItem);
//                 },
//                 icon: Icon(Icons.add)),
//           ],
//         ),
//         Spacer(flex: 1),
//         Icon(
//           Icons.favorite,
//           color: fav ? Colors.red : Colors.grey,
//         ),
//       ],
//     );