import 'package:e_commerce/core/shared/widgets/skeleton.dart';
import 'package:e_commerce/features/products/domain/entities/product_enitty.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/constants/app_numbers.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.product,
  });

  final ProductEntity? product;
  @override
  Widget build(BuildContext context) {
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
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  return state is GetAllProductsLoading
                      ? Column(
                          children: [
                            Stack(
                              children: [
                                LoadingProductImage(
                                  constraints: constraints,
                                ),
                                LoadingFaviourt(
                                  constraints: constraints,
                                ),
                              ],
                            ),
                            const SizedBox(height: padding4 * 3),
                            LoadingProductName(
                              constraints: constraints,
                            ),
                            const SizedBox(height: padding4 * 1),
                            LoadingProductPrice(
                              constraints: constraints,
                            ),
                            const SizedBox(
                              height: padding4 * 1,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ProductImage(
                                  mainImageUrl: product!.mainImageUrl,
                                ),
                                Faviourt(
                                  isFav: product!.isFavorite,
                                ),
                              ],
                            ),
                            const SizedBox(height: padding4 * 3),
                            ProductName(
                              productName: product!.productName,
                            ),
                            const SizedBox(height: padding4 * 1),
                            ProductPrice(
                              productPrice: product!.price,
                            ),
                            const SizedBox(
                              height: padding4 * 1,
                            ),
                            ProductStore(
                              storeName: product!.storeName,
                            ),
                          ],
                        );
                },
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
    required this.storeName,
  });

  final String storeName;

  @override
  Widget build(BuildContext context) {
    String fromText = AppLocalizations.of(context)!.from;
    return Text.rich(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      TextSpan(
        text: fromText, // "From" part
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        children: <TextSpan>[
          TextSpan(
            text: storeName, // "Free Syria" part
            style: const TextStyle(
              fontWeight: FontWeight.normal, // Regular weight for "Free Syria"
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.productPrice,
  });

  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$productPrice',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        // color: Colors.black,
      ),
    );
  }
}

class LoadingProductPrice extends StatelessWidget {
  const LoadingProductPrice({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Skeleton(
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
    required this.productName,
  });

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        // color: Color(0xFF5D6062),
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class LoadingProductName extends StatelessWidget {
  const LoadingProductName({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Skeleton(
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
    required this.isFav,
  });

  final int isFav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Icon(
        isFav == 1 ? Icons.favorite : Icons.favorite_border,
        size: 28,
        color: AppColors.favouriteColor,
      ),
    );
  }
}

class LoadingFaviourt extends StatelessWidget {
  const LoadingFaviourt({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return const Skeleton(
      width: 42,
      height: 42,
      radius: 42,
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.mainImageUrl,
  });

  final String mainImageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      mainImageUrl,
    );
  }
}

class LoadingProductImage extends StatelessWidget {
  const LoadingProductImage({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return const Skeleton(
      width: double.infinity,
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
