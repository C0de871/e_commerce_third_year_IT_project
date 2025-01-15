import 'package:e_commerce/features/stores/domain/entities/store_entity.dart';
import 'package:flutter/material.dart';

class StoreCardTrailing extends StatelessWidget {
  const StoreCardTrailing({
    super.key,
    required this.item,
  });

  final StoreEntity item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.manager,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              letterSpacing: 0,
              fontWeight: FontWeight.w900,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            item.location,
            maxLines: 1,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
