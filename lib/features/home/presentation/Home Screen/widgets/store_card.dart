import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/shared/widgets/skeleton.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/features/stores/domain/entities/store_entity.dart';
import 'package:e_commerce/features/stores/presentation/cubit/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants/app_numbers.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    this.storeEntity,
  });

  final StoreEntity? storeEntity;
  // final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state is GetAllStoresLoading
            ? const StoreCardLoading()
            : StoreCardLoaded(
                image: storeEntity!.imageUrl,
                storeName: storeEntity!.name,
                discreption: storeEntity!.description,
              );
      },
    );
  }
}

class StoreCardLoaded extends StatelessWidget {
  const StoreCardLoaded({
    super.key,
    required this.image,
    required this.storeName,
    required this.discreption,
  });

  final String image;
  final String storeName;
  final String discreption;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 242,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            StorePreview(
              storeName: storeName,
              discreption: discreption,
            ),
          ],
        ),
      ),
    );
  }
}

class StoreCardLoading extends StatelessWidget {
  const StoreCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Skeleton(
      width: 242,
      height: 100,
      radius: 20,
      margin: null,
    );
    // return SizedBox(
    //   width: 242,
    //   height: 100,
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(20),
    //     child: Stack(
    //       children: [
    //         Image.asset(image, fit: BoxFit.cover),
    //         StorePreview(
    //           storeName: storeName,
    //           discreption: discreption,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class StorePreview extends StatelessWidget {
  const StorePreview({
    super.key,
    required this.storeName,
    required this.discreption,
  });

  final String storeName;
  final String discreption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: padding4 * 4,
        vertical: padding4 * 3,
      ),
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gradientDarkGrey,
            AppColors.gradientLightGrey,
          ],
        ),
      ),
      child: StoreNameAndDescription(
        storeName: storeName,
        discreption: discreption,
      ),
    );
  }
}

class StoreNameAndDescription extends StatelessWidget {
  const StoreNameAndDescription({
    super.key,
    required this.storeName,
    required this.discreption,
  });

  final String storeName;
  final String discreption;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      overflow: TextOverflow.ellipsis,
      TextSpan(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        children: [
          TextSpan(
            text: '$storeName\n',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: discreption,
          ),
        ],
      ),
    );
  }
}
