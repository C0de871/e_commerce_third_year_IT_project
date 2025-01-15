import 'package:e_commerce/features/stores/presentation/cubit/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_item_content.dart';
import 'list_tile_skeleton.dart';

class StoreListItem extends StatelessWidget {
  const StoreListItem({
    required this.index,
    super.key,
    required this.storeCubits,
    required this.querySearch,
  });
  final int index;
  final List<StoreCubit> storeCubits;
  final String querySearch;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      key: ValueKey<String>('list_item_blocBuilder_$index'),
      buildWhen: (p, c) => p != c,
      builder: (context, state) {
        if (state is! GetAllStoresSuccess) {
          return const ListTileSkeleton();
        }
        final page = (index ~/ 20) + 1;
        final indexOnPage = index % 20;
        return BlocProvider.value(
          key: ValueKey<String>(
            'list_item_content_${page}_${indexOnPage}_blocProvider',
          ),
          value: storeCubits[page - 1]
            ..getAllStores(
              page: page,
              querySearch: querySearch,
            ),
          child: ListItemContent(
            key: ValueKey<String>('list_item_content_${page}_$indexOnPage'),
            index: index,
            page: page,
            indexOnPage: indexOnPage,
          ),
        );
      },
    );
  }
}
