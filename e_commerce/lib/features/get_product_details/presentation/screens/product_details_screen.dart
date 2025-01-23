// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:e_commerce/core/helper/app_functions.dart';
import 'package:e_commerce/features/cart/presentation/cubit/add_to_cart_cubit.dart';
import 'package:e_commerce/features/get_product_details/presentation/screens/widgets/product_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:e_commerce/core/shared/widgets/rounded_icon.dart';
import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:flutter/src/widgets/image.dart' as flutter_image;
import 'package:svg_flutter/svg_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/constants/app_images.dart';
import '../../../../core/utils/constants/app_rive.dart';
import '../../../favorites/presentation/cubit/toggle_fav_cubit.dart';
import '../../../products/domain/entities/product_entity.dart';
import '../cubit/get_product_details_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductEntity productDetails = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      // backgroundColor: AppColors.grayBackGroundColor,
      // backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        actions: [],
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.surface,
          statusBarIconBrightness: Theme.of(context).brightness == Brightness.light ? Brightness.dark : Brightness.light,
        ),
        leadingWidth: 80,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: padding4 * 5,
            top: padding4 * 5,
            right: padding4 * 5,
          ),
          child: RoundedIconBtn(
            icon: Icons.arrow_back_ios_new,
            callback: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: [
          ProductName(productDetails: productDetails),
          ProductImages(productDetails: productDetails),
          SizedBox(height: padding4 * 12),
          StoreCard(productDetails: productDetails),
          SizedBox(height: padding4 * 12),
          Expanded(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IsFavorite(),
                    SizedBox(height: padding4 * 2),
                    Description(productDetails: productDetails),
                  ],
                ),
                AddToCardFooter(productDetails: productDetails)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddToCardFooter extends StatelessWidget {
  const AddToCardFooter({
    super.key,
    required this.productDetails,
  });

  final ProductEntity productDetails;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: padding4 * 5,
          vertical: padding4 * 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Price(productDetails: productDetails),
            CartEditContainer(),
            AddToCartBtn(
              productDetails: productDetails,
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartBtn extends StatelessWidget {
  const AddToCartBtn({
    super.key,
    required this.productDetails,
  });

  final ProductEntity productDetails;

  @override
  Widget build(BuildContext context) {
    int productquantity=0;
    if (context.read<GetProductDetailsCubit>().state is GetProductDetailsSuccess) {
      productquantity = (context.read<GetProductDetailsCubit>().state as GetProductDetailsSuccess).productDetailsEntity.data!.quantityInCart!;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        context.read<AddToCartCubit>().addToCartTrigger(
              productID: productDetails.productId!.toString(),
              storeID: productDetails.storeId!.toString(),
              orderQuantity: productquantity!,
            );
      },
      child: SvgPicture.asset(
        AppImages.cartIcon,
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
      ),
    );
  }
}

class CartEditContainer extends StatelessWidget {
  const CartEditContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: EdgeInsets.symmetric(
        vertical: padding4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              context.read<GetProductDetailsCubit>().decrease();
            },
            child: Icon(
              Icons.remove,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          CartQuantity(),
          InkWell(
            onTap: () {
              context.read<GetProductDetailsCubit>().increase();
            },
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class CartQuantity extends StatelessWidget {
  const CartQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
      builder: (context, state) {
        if (state is GetProductDetailsSuccess) {
          log("rebuild the cart ");
          return Text(
            "${state.productDetailsEntity.data!.quantityInCart!}",
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.bold,
            ),
          );
        } else if (state is GetProductDetailsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Text("Failed");
        }
      },
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    super.key,
    required this.productDetails,
  });

  final ProductEntity productDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.price,
          style: TextStyle(color: AppColors.darkGray),
        ),
        Text(
          "\$${productDetails.price}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    required this.productDetails,
  });

  final ProductEntity productDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: padding4 * 5,
        right: padding4 * 5,
      ),
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: flutter_image.Image.asset(
              "assets/images/logo_with_brown_background.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        trailing: Container(
          width: 35,
          height: 35,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        contentPadding: EdgeInsets.only(
          left: padding4 * 2,
          top: padding4,
          bottom: padding4,
          right: padding4 * 3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Theme.of(context).colorScheme.surfaceContainer,
        // tileColor: Color.fromARGB(255, 239, 240, 243),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          fontSize: 16,
        ),
        title: Text(productDetails.storeName!),
        subtitle: Text(
          AppLocalizations.of(context)!.viewStore,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.productDetails,
  });

  final ProductEntity productDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: padding4 * 5,
        right: padding4 * 5,
      ),
      child: Text(
        productDetails.description!,
        maxLines: 3,
        style: TextStyle(
          color: AppColors.grayColor,
        ),
      ),
    );
  }
}

class ProductName extends StatelessWidget {
  const ProductName({
    super.key,
    required this.productDetails,
  });

  final ProductEntity productDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding4 * 5, right: 72),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          productDetails.productName!,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class IsFavorite extends StatefulWidget {
  const IsFavorite({
    super.key,
  });

  @override
  State<IsFavorite> createState() => _IsFavoriteState();
}

class _IsFavoriteState extends State<IsFavorite> {
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
    return BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
      builder: (context, state) {
        final rtl = isRtl(context);
        final alignment = rtl ? Alignment.centerLeft : Alignment.centerRight;
        if (state is GetProductDetailsSuccess) {
          final isFavorite = (state).productDetailsEntity.data!.isFavorite;
          final storeID = (state).productDetailsEntity.data!.storeId;
          final productID = (state).productDetailsEntity.data!.productId;
          isFavoriteSMI?.value = isFavorite == 1;
          return Align(
            alignment: alignment,
            child: Container(
              padding: EdgeInsets.only(
                top: padding4 * 1,
                bottom: padding4 * 1,
              ),
              width: 72,
              decoration: BoxDecoration(
                color: isFavorite == 1 ? const Color.fromARGB(255, 251, 207, 204) : AppColors.disableFavContainer,
                borderRadius: BorderRadius.only(
                  topRight: rtl ? Radius.circular(20) : Radius.circular(0),
                  bottomRight: rtl ? Radius.circular(20) : Radius.circular(0),
                  topLeft: rtl ? Radius.circular(0) : Radius.circular(20),
                  bottomLeft: rtl ? Radius.circular(0) : Radius.circular(20),
                ),
              ),
              child: artboard == null
                  ? SizedBox()
                  : GestureDetector(
                      onTap: () async {
                        if (isFavorite == 0) {
                          await context.read<ToggleFavCubit>().toggleFavOnTrigger(
                                storeID: storeID!,
                                productID: productID!,
                              );
                        } else {
                          await context.read<ToggleFavCubit>().toggleFavOffTrigger(
                                storeID: storeID!,
                                productID: productID!,
                              );
                        }
                      },
                      child: SizedBox(
                        width: 36,
                        height: 36,
                        child: Rive(artboard: (artboard)!),
                      ),
                    ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
