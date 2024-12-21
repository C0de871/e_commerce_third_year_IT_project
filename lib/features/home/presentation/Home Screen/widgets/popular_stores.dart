import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:flutter/material.dart';

import 'store_card.dart';

class PopularStores extends StatelessWidget {
  const PopularStores({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: padding4 * 4,
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            //todo: this will be fetch from the api
            child: Row(
              children: [
                StoreCard(
                  press: () {},
                  image: 'assets/images/Image Banner 2.png',
                  storeName: 'SmartPhone',
                  discreption: "this is a long long long long  long long long  long long long long long long long long description about phone",
                ),
                const SizedBox(
                  width: 20,
                ),
                StoreCard(
                  press: () {},
                  image: 'assets/images/Image Banner 3.png',
                  storeName: 'Fashion',
                  discreption: "this is short",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
