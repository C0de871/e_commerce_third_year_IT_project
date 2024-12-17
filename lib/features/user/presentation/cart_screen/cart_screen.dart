import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/features/user/data/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: padding4 * 22,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                  child: Container(
                    padding: EdgeInsets.all(padding4*2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(padding4*4),
                      //ToDo COLOR....
                    ),
                    child: Image.asset(AppImages.successImage),
                    //TodO demoCarts[0].product.image[0]
                  ),),
                ),
                SizedBox(
                  width: padding4*5,
                ),Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("title of product",
                    maxLines: 2, 
                    //TODO style of product
                    ),
                    SizedBox(height: padding4*2,),
                    const Text.rich(TextSpan(text:"price")
                    //ToDo Style + demoCart[0].product.price
                    )
                    
                  ],
                )
              ],
            ),
          ],
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(children: [
        Text(
          AppLocalizations.of(context)!.yourCart,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
            "${demoCarts.length} ${AppLocalizations.of(context)!.numberOfItem}"),
      ]),
    );
  }
}
