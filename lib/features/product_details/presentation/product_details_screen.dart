import 'package:e_commerce/core/shared/widgets/rounded_icon.dart';
import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/products/domain/entities/product_enitty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductEntity productDetails =
        ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // backgroundColor : Colors.white,
      appBar: AppBar(
        actions: [],
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness:
              Theme.of(context).brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
        ),
        leadingWidth: 60,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: padding4 * 5,
            top: padding4 * 5,
          ),
          child: RoundedIconBtn(
            icon: Icons.arrow_back_ios_new,
            callback: () {},
          ),
        ),
      ),
      body: ProductImages(productDetails: productDetails),
    );
  }
}

class ProductImages extends StatefulWidget {
  const ProductImages({
    super.key,
    required this.productDetails,
  });

  final ProductEntity productDetails;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 230,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              widget.productDetails.mainImageUrl,
            ),
          ),
        ),
        SizedBox(
          height: padding4 * 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ...List.generate(
            // )
            SmallImagePreview(productDetails: widget.productDetails),
          ],
        ),
      ],
    );
  }
}

class SmallImagePreview extends StatelessWidget {
  const SmallImagePreview({
    super.key,
    required this.productDetails,
  });

  final ProductEntity productDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding4 * 2),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      child: Image.network(productDetails.mainImageUrl),
    );
  }
}
