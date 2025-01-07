
import 'package:e_commerce/features/stores/presentation/all_stores/widgets/store_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/store_cubit.dart';
import 'list_tile_skeleton.dart';
import 'store_card_trailing.dart';

class ListItemContent extends StatelessWidget {
  const ListItemContent({
    required this.index,
    required this.page,
    required this.indexOnPage,
    super.key,
  });
  final int index;
  final int page;
  final int indexOnPage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      key: ValueKey<String>(
        'list_item_content_${page}_${indexOnPage}_blocBuilder',
      ),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is! GetAllStoresSuccess) {
          return const ListTileSkeleton();
        }
        final currentState = state;
        final item = currentState.storesList.data.stores[indexOnPage];
        return ListTile(
          key: ValueKey<int>(index),
          onTap: () {
            // context.read<GetProductDetailsCubit>().getProductDetailsTrigger(
            //       productID: item.productId.toString(),
            //       storeID: item.storeId.toString(),
            //     );
            // Navigator.of(context).pushNamed(
            //   AppRoutes.productDetailsScreen,
            //   arguments: item,
            // );
          },
          minLeadingWidth: 100,
          leading: StoreAvatar(item: item),
          title: Text(
            item.name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            item.description,
            maxLines: 1,
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
          enabled: true,
          trailing: StoreCardTrailing(item: item),
        );
      },
    );
  }
}
