import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/image.dart' as FlutterImage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import 'package:e_commerce/core/shared/widgets/skeleton.dart';
import 'package:e_commerce/core/utils/constants/app_images.dart';
import 'package:e_commerce/features/favorites/presentation/cubit/toggle_fav_cubit.dart';
import 'package:e_commerce/features/products/domain/entities/product_enitty.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_cubit.dart';

import '../../../../../core/Routes/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/constants/app_numbers.dart';
import '../../../../../core/utils/constants/app_rive.dart';

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
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.productDetailsScreen);
            },
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
                            Align(
                              alignment: Alignment.topCenter,
                              child: ProductImage(
                                mainImageUrl: product!.mainImageUrl,
                                constraints: constraints,
                              ),
                            ),
                            const SizedBox(
                              height: padding4 * 4,
                            ),
                            ProductName(
                              productName: product!.productName,
                            ),
                            ProductStore(
                              storeName: product!.storeName,
                            ),
                            const SizedBox(height: padding4 * 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductPrice(
                                  productPrice: product!.price,
                                ),
                                Faviourt(
                                  product: product,
                                ),
                              ],
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
      height: 25,
      radius: 0,
      margin: const EdgeInsets.only(top: 5),
    );
  }
}

class Faviourt extends StatefulWidget {
  const Faviourt({
    super.key,
    required this.product,
  });

  final ProductEntity? product;

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
        log("${controller!.inputs}");
        for (var input in controller!.inputs) {
          if (input is SMIBool) {
            log("is SMI bool");
            isFavoriteSMI = input;
          } else if (input is SMINumber) {
            log("is SMI Number");
          } else if (input is SMITrigger) {
            log("is SMI Trigger");
          } else {
            log("NO input found!");
          }
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
    isFavoriteSMI?.value = widget.product!.isFavorite == 1;
    return GestureDetector(
      onTap: () async {
        if (widget.product?.isFavorite == 0) {
          await context.read<ToggleFavCubit>().toggleFavOnTrigger(
                storeID: widget.product!.storeId,
                productID: widget.product!.productId,
              );
        } else {
          await context.read<ToggleFavCubit>().toggleFavOffTrigger(
                storeID: widget.product!.storeId,
                productID: widget.product!.productId,
              );
        }
      },
      // borderRadius: BorderRadius.circular(20),
      // child: Icon(
      //   Icons.favorite,
      //   size: 20,
      //   color: widget.product?.isFavorite == 1 ? Colors.red : AppColors.disableFav,
      // ),
      child: Container(
        padding: EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.product!.isFavorite == 1 ? const Color.fromARGB(255, 251, 207, 204) : AppColors.disableFavContainer,
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
      width: 42,
      height: 42,
      radius: 42,
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.mainImageUrl, required this.constraints});

  final String mainImageUrl;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        padding4 * 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.imageBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: FlutterImage.Image.network(
        mainImageUrl,
      ),
      // child: FlutterImage.Image.asset(AppImages.tShirt),
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
