import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/get_product_details/presentation/cubit/get_product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import 'package:e_commerce/core/shared/widgets/skeleton.dart';
import 'package:e_commerce/features/favorites/presentation/cubit/toggle_fav_cubit.dart';

import '../../../../../core/Routes/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/constants/app_numbers.dart';
import '../../../../../core/utils/constants/app_rive.dart';
import '../../../../products/domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductEntity product;

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
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<GetProductDetailsCubit>().getProductDetailsTrigger(
                    productID: product.productId.toString(),
                    storeID: product.storeId.toString(),
                  );
              Navigator.of(context).pushNamed(
                AppRoutes.productDetailsScreen,
                arguments: product,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(padding4 * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ProductImage(
                      mainImageUrl: product.mainImageUrl!,
                      constraints: constraints,
                    ),
                  ),
                  const SizedBox(
                    height: padding4 * 4,
                  ),
                  ProductName(
                    productName: product.productName!,
                  ),
                  ProductStore(
                    storeName: product.storeName!,
                  ),
                  const SizedBox(height: padding4 * 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductPrice(
                        productPrice: product.price!,
                      ),
                      Faviourt(
                        isFav: product.isFavorite!,
                        productId: product.productId!,
                        storeId: product.storeId!,
                      ),
                    ],
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

class ProductCardLoading extends StatelessWidget {
  const ProductCardLoading({
    super.key,
  });

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
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
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
                      LoadingProductImage(
                        constraints: constraints,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: padding4 * 4,
                  ),
                  LoadingProductName(
                    constraints: constraints,
                  ),
                  const SizedBox(height: padding4 * 1),
                  Skeleton(
                    width: constraints.maxWidth * 0.40,
                    height: 10,
                    radius: 0,
                  ),
                  const SizedBox(height: padding4 * 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoadingProductPrice(
                        constraints: constraints,
                      ),
                      LoadingFaviourt(
                        constraints: constraints,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: padding4 * 1,
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
    required this.storeName,
  });

  final String storeName;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: storeName, // "Free Syria" part
            style: const TextStyle(
              fontWeight: FontWeight.normal, // Regular weight for "Free Syria"
              color: AppColors.grayColor,
              fontSize: 12,
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
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.inversePrimary,
        fontSize: 16,
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
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.black,
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
      height: 14,
      radius: 0,
      margin: const EdgeInsets.only(top: 5),
    );
  }
}

class Faviourt extends StatefulWidget {
  const Faviourt({
    super.key,
    required this.isFav,
    required this.productId,
    required this.storeId,
  });

  final int isFav, productId, storeId;

  @override
  State<Faviourt> createState() => _FaviourtState();
}

class _FaviourtState extends State<Faviourt> {
  StateMachineController? controller;
  Artboard? artboard;
  SMIBool? isFavoriteSMI;

  @override
  void initState() {
    log("init animated  heart  state");
    rootBundle.load(AppRive.heartIcons).then((value) async {
      await RiveFile.initialize();
      final file = RiveFile.import(value);
      final art = file.artboardByName("favorite ");
      controller = StateMachineController.fromArtboard(art!, "State Machine 1");
      if (controller != null) {
        art.addController(controller!);
        for (var input in controller!.inputs) {
          if (input is SMIBool) {
            isFavoriteSMI = input;
          } else if (input is SMINumber) {
          } else if (input is SMITrigger) {
          } else {}
        }
        setState(() {
          artboard = art;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isFavoriteSMI?.value = widget.isFav == 1;
    return GestureDetector(
      onTap: () async {
        if (widget.isFav == 0) {
          await context.read<ToggleFavCubit>().toggleFavOnTrigger(
                storeID: widget.storeId,
                productID: widget.productId,
              );
        } else {
          await context.read<ToggleFavCubit>().toggleFavOffTrigger(
                storeID: widget.storeId,
                productID: widget.productId,
              );
        }
      },
      child: Container(
        padding: EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.isFav == 1
              ? const Color.fromARGB(255, 251, 207, 204)
              : AppColors.disableFavContainer,
        ),
        child: artboard == null
            ? SizedBox()
            : SizedBox(
                width: 36,
                height: 36,
                child: Rive(artboard: (artboard)!),
              ),
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
      width: 36,
      height: 36,
      radius: 42,
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage(
      {super.key, required this.mainImageUrl, required this.constraints});

  final String mainImageUrl;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        imageUrl: mainImageUrl,
        imageBuilder: (context, imageProvider) => Container(
          padding: const EdgeInsets.all(
            padding4 * 4,
          ),
          decoration: BoxDecoration(
            color: AppColors.imageBackground,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: imageProvider),
          ),
          // child: FlutterImage.Image.asset(AppImages.tShirt),
        ),
      ),
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
