import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // color: Colors.grey.withOpacity(0.3),
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AppStrings.discountBanner,
          ),
        ),
      ),
    );
  }
}
