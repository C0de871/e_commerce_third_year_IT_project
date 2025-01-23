// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants/app_numbers.dart';
import '../../../../products/domain/entities/product_entity.dart';
import '../../cubit/get_product_details_cubit.dart';
import 'big_image_preview.dart';
import 'small_image_preview.dart';

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
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BigImagePreview(selectedImage: selectedImage),
        SizedBox(
          height: padding4 * 4,
        ),
        BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
          builder: (context, state) {
            List? productImagesUrl;

            if (state is GetProductDetailsSuccess) {
              productImagesUrl = [state.productDetailsEntity.data!.mainImage];
              productImagesUrl!.addAll(state.productDetailsEntity.data!.subImages!.map((e) => e.image));
            }
            // productImagesUrl = [
            //   "http://192.168.135.32:8000/storage//products/ps4_console_white_1.png",
            //   "http://192.168.135.32:8000/storage//products/ps4_console_white_2.png",
            //   "http://192.168.135.32:8000/storage//products/ps4_console_white_3.png",
            //   "http://192.168.135.32:8000/storage//products/ps4_console_white_4.png",
            // ];
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is GetProductDetailsSuccess)
                  ...List.generate(productImagesUrl!.length, (index) {
                    return SmallImagePreview(
                      imageUrl: productImagesUrl![index],
                      selectedImage: selectedImage,
                      index: index,
                      onTap: () {
                        setState(() {
                          selectedImage = index;
                        });
                      },
                    );
                  })
              ],
            );
          },
        ),
      ],
    );
  }
}
