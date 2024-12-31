import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/stores/presentation/cubit/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../stores/domain/entities/store_entity.dart';
import 'store_card.dart';

class PopularStores extends StatelessWidget {
  const PopularStores({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: padding4 * 4,
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            //todo: this will be fetch from the api
            child: BlocConsumer<StoreCubit, StoreState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                late List<StoreEntity> stores;
                if (state is GetAllStoresSuccess) {
                  stores = state.storesList.data.stores;
                }
                return Row(
                  children: [
                    if (state is GetAllStoresLoading)
                      ...List.generate(
                        4,
                        (index) {
                          return Row(
                            children: [
                              const StoreCard(),
                              if (index != 3)
                                const SizedBox(
                                  width: padding4 * 5,
                                ),
                            ],
                          );
                        },
                      ),
                    if (state is GetAllStoresSuccess)
                      ...List.generate(
                        stores.length,
                        (index) => Row(
                          children: [
                            StoreCard(
                              storeEntity: stores[index],
                            ),
                            if (index != (stores.length - 1))
                              const SizedBox(
                                width: padding4 * 5,
                              ),
                          ],
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
