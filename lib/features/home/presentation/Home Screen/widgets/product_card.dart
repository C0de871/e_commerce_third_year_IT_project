import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_numbers.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.fetchProductState,
  });
  final FetchProductState fetchProductState;

  @override
  Widget build(BuildContext context) {
    String fromText = AppLocalizations.of(context)!.from;
    return Container(
      constraints: BoxConstraints(
        maxWidth: (MediaQuery.sizeOf(context).width - padding4 * 8) / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      // width: MediaQuery.sizeOf(context).width / 2,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(padding4 * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ProductImage(fetchProductState: fetchProductState),
                      Faviourt(fetchProductState: fetchProductState),
                    ],
                  ),
                  const SizedBox(height: padding4 * 3),
                  ProductName(
                    fetchProductState: fetchProductState,
                    constraints: constraints,
                  ),
                  const SizedBox(height: padding4 * 1),
                  ProductPrice(
                    fetchProductState: fetchProductState,
                    constraints: constraints,
                  ),
                  const SizedBox(
                    height: padding4 * 1,
                  ),
                  ProductStore(
                    fetchProductState: fetchProductState,
                    fromText: fromText,
                    constraints: constraints,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ProductStore extends StatelessWidget {
  const ProductStore({
    super.key,
    required this.fetchProductState,
    required this.fromText,
    required this.constraints,
  });

  final FetchProductState fetchProductState;
  final String fromText;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: skeletonBuilder(
        fetchProductState: fetchProductState,
        child: Text.rich(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          TextSpan(
            text: fromText, // "From" part
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: 'Free Syria', // "Free Syria" part
                style: TextStyle(
                  fontWeight: FontWeight.normal, // Regular weight for "Free Syria"
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        width: constraints.maxWidth * 0.45,
        height: 30,
        radius: 0,
        margin: const EdgeInsets.only(top: 5),
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.fetchProductState,
    required this.constraints,
  });

  final FetchProductState fetchProductState;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return skeletonBuilder(
      fetchProductState: fetchProductState,
      child: const Text(
        '\$96.00',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          // color: Colors.black,
        ),
      ),
      width: constraints.maxWidth * 0.45,
      height: 30,
      radius: 0,
      margin: const EdgeInsets.only(top: 5),
    );
  }
}

class ProductName extends StatelessWidget {
  const ProductName({
    super.key,
    required this.fetchProductState,
    required this.constraints,
  });
  final FetchProductState fetchProductState;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return skeletonBuilder(
      fetchProductState: fetchProductState,
      child: Text(
        'Excellent T-shirt',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          // color: Color(0xFF5D6062),
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      width: constraints.maxWidth * 0.75,
      height: 25,
      radius: 0,
      margin: const EdgeInsets.only(top: 5),
    );
  }
}

class Faviourt extends StatelessWidget {
  const Faviourt({
    super.key,
    required this.fetchProductState,
  });

  final FetchProductState fetchProductState;
  @override
  Widget build(BuildContext context) {
    return skeletonBuilder(
      fetchProductState: fetchProductState,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: const Favorite(),
      ),
      width: 42,
      height: 42,
      radius: 42,
      margin: const EdgeInsets.only(bottom: 5),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.fetchProductState});
  final FetchProductState fetchProductState;

  @override
  Widget build(BuildContext context) {
    return skeletonBuilder(
      fetchProductState: fetchProductState,
      child: Image.asset(
        'assets/images/tshirt.png',
      ),
      height: 210,
      radius: 0,
      margin: EdgeInsets.zero,
    );
  }
}

class Rate extends StatelessWidget {
  const Rate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFF1E0),
        // border: BoxBorder()
        border: Border.all(
          color: const Color(0xFFEFE3D4),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.star,
            color: Color(0xFFFBAB6D),
            size: 20,
          ),
          SizedBox(width: 5),
          Text(
            '4.8',
            style: TextStyle(
              color: Color(0xFFFBAB6D),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Text(
            '[17]',
            style: TextStyle(
              color: Color(0xFFFBAB6D),
            ),
          ),
        ],
      ),
    );
  }
}

class Favorite extends StatelessWidget {
  const Favorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.favorite,
      size: 28,
      color: AppColors.favouriteColor,
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    required this.margin,
  });
  final EdgeInsets? margin;
  final double? width, height, radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget skeletonBuilder({required FetchProductState fetchProductState, required Widget child, double? width, double? height, required double radius, EdgeInsets? margin}) {
  if (fetchProductState == FetchProductState.LOADING) {
    return Skeleton(
      margin: margin,
      width: width,
      height: height,
      radius: radius,
    );
  } else {
    return child;
  }
}

//todo:
enum FetchProductState {
  LOADING,
  SUCCESS,
  ERROR,
}
