import 'package:e_commerce/core/constants/app_images.dart';
// import 'package:e_commerce/core/constants/app_numbers.dart';
// import 'package:e_commerce/features/product/data/models/cart.dart';
// import 'package:e_commerce/features/product/presentation/cart_screen/Widgets/cart_item_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:svg_flutter/svg.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: buildAppBar(context),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: padding4 * 5),
//           child: ListView.builder(
//             itemCount: demoCarts.length,
//             itemBuilder: (BuildContext context, int index) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Dismissible(
//                 key: Key(demoCarts[index].product.id.toString()),
//                 direction: DismissDirection.endToStart,
//                 background: Container(
//                   padding: EdgeInsets.symmetric(horizontal: padding4 * 5),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.primaryContainer,
//                     borderRadius: BorderRadius.circular(padding4 * 3.5),
//                   ),
//                   child: Row(
//                     children: [
//                       const Spacer(),
//                       SvgPicture.asset(AppImages.trachIcon),
//                     ],
//                   ),
//                 ),
//                 onDismissed: (direction) {},
//                 child: CartItemCard(
//                   cart: demoCarts,
//                   index: null,
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }

//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       title: Column(children: [
//         Text(
//           AppLocalizations.of(context)!.yourCart,
//           style: Theme.of(context).textTheme.displaySmall,
//         ),
//         Text(
//             "${demoCarts.length} ${AppLocalizations.of(context)!.numberOfItem}"),
//       ]),
//       centerTitle: true,
//     );
//   }
// }
