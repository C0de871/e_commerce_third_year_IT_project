import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/app_functions.dart';
import '../../../../core/shared/widgets/animated_search_field/animated_search_field.dart';
import '../../../../core/utils/constants/app_numbers.dart';
import '../cubit/store_cubit.dart';
import 'widgets/store_list_item.dart';
import 'widgets/list_tile_skeleton.dart';

class StoreList extends StatefulWidget {
  const StoreList({super.key});

  @override
  State<StoreList> createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  TextEditingController textEditingController = TextEditingController();
  String querySearch = "";

  @override
  Widget build(BuildContext context) {
    List<StoreCubit>? storeCubits;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Stores"),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(padding: EdgeInsets.only(bottom: padding4 * 12)),
              BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  if (state is GetAllStoresSuccess) {
                    storeCubits = [
                      context.read<StoreCubit>(),
                      ...List.generate(
                        state.storesList.pagination.totalPages! - 1,
                        (index) => StoreCubit(),
                      )
                    ];
                  }
                  return switch (state) {
                    StoreInitial() || GetAllStoresLoading() => SliverList.separated(
                        key: const Key('loading_listview'),
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return const ListTileSkeleton();
                        },
                        itemCount: 10,
                      ),
                    GetAllStoresSuccess() => SliverList.separated(
                        itemBuilder: (context, index) {
                          return StoreListItem(
                            querySearch: querySearch,
                            key: ValueKey<int>(index),
                            index: index,
                            storeCubits: storeCubits!,
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: state.storesList.pagination.totalItems,
                        findChildIndexCallback: (key) {
                          final typedKey = key as ValueKey<int>;
                          return typedKey.value;
                        },
                      ),
                    GetAllStoresFailed() => const SliverToBoxAdapter(),
                  };
                },
              )
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padding4 * 4,
                vertical: padding4 * 2,
              ),
              child: AnimSearchBar(
                width: MediaQuery.sizeOf(context).width - padding4 * 8,
                color: Theme.of(context).colorScheme.primaryContainer,
                textFieldColor: Theme.of(context).colorScheme.surface,
                textController: textEditingController,
                onSuffixTap: () {
                  textEditingController.clear();
                  querySearch = "";
                  context.read<StoreCubit>().reset();
                  context.read<StoreCubit>().getAllStores(querySearch: "");
                },
                onSubmitted: (value) {
                  if (value.isEmpty) return;
                  querySearch = value;
                  context.read<StoreCubit>().reset();
                  context.read<StoreCubit>().getAllStores(querySearch: value);
                },
                helpText: "Search Stores...",
                closeSearchOnSuffixTap: true,
                rtl: isRtl(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
