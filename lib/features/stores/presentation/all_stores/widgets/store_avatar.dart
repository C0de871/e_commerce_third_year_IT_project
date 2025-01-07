import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/stores/domain/entities/store_entity.dart';
import 'package:flutter/material.dart';

class StoreAvatar extends StatelessWidget {
  const StoreAvatar({
    super.key,
    required this.item,
  });

  final StoreEntity item;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: item.imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
      width: 100,
      height: 48,
    );
  }
}
