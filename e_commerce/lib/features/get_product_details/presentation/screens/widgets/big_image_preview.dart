// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_commerce/features/get_product_details/presentation/cubit/get_product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BigImagePreview extends StatelessWidget {
  const BigImagePreview({
    super.key,
    required this.selectedImage,
  });
  final int selectedImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
        builder: (context, state) {
          List? productImagesUrl;

          // productImagesUrl = [state.productDetailsEntity.data!.mainImage];
          // productImagesUrl!.addAll(state.productDetailsEntity.data!.subImages!.map((e) => e.image));
          productImagesUrl = [
            "http://192.168.135.32:8000/storage//products/ps4_console_white_1.png",
            "http://192.168.135.32:8000/storage//products/ps4_console_white_2.png",
            "http://192.168.135.32:8000/storage//products/ps4_console_white_3.png",
            "http://192.168.135.32:8000/storage//products/ps4_console_white_4.png",
          ];
          if (state is GetProductDetailsSuccess) {
            return AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                productImagesUrl[selectedImage],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
