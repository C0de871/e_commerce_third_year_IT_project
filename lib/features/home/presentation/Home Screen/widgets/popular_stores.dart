// import 'package:e_commerce/core/utils/constants/app_numbers.dart';
// import 'package:e_commerce/features/stores/presentation/cubit/store_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../stores/domain/entities/store_entity.dart';
// import 'store_card.dart';

// class PopularStores extends StatelessWidget {
//   const PopularStores({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: padding4 * 4,
//       ),
//       child: Column(
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             //todo: this will be fetch from the api
//             child: BlocConsumer<StoreCubit, StoreState>(
//               listener: (context, state) {
//                 // TODO: implement listener
//               },
//               builder: (context, state) {
//                 late List<StoreEntity> stores;
//                 if (state is GetAllStoresSuccess) {
//                   stores = state.storesList.data.stores;
//                 }
//                 return Row(
//                   children: [
//                     if (state is GetAllStoresLoading)
//                       ...List.generate(
//                         4,
//                         (index) {
//                           return Row(
//                             children: [
//                               const StoreCard(),
//                               if (index != 3)
//                                 const SizedBox(
//                                   width: padding4 * 5,
//                                 ),
//                             ],
//                           );
//                         },
//                       ),
//                     if (state is GetAllStoresSuccess)
//                       ...List.generate(
//                         stores.length,
//                         (index) => Row(
//                           children: [
//                             StoreCard(
//                               storeEntity: stores[index],
//                             ),
//                             if (index != (stores.length - 1))
//                               const SizedBox(
//                                 width: padding4 * 5,
//                               ),
//                           ],
//                         ),
//                       )
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/features/stores/presentation/cubit/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          SizedBox(
            height: 100, // Adjust height based on your StoreCard dimensions
            child: BlocConsumer<StoreCubit, StoreState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is GetAllStoresLoading) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index != 3 ? padding4 * 5 : 0,
                        ),
                        child: const StoreCard(),
                      );
                    },
                  );
                }

                if (state is GetAllStoresSuccess) {
                  final stores = state.storesList.data.stores;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stores.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index != (stores.length - 1) ? padding4 * 5 : 0,
                        ),
                        child: StoreCard(
                          storeEntity: stores[index],
                        ),
                      );
                    },
                  );
                }

                // Handle other states if needed
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:e_commerce/core/utils/constants/app_numbers.dart';
// import 'package:e_commerce/features/stores/presentation/cubit/store_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../stores/domain/entities/store_entity.dart';
// import 'store_card.dart';

// class PopularStores extends StatelessWidget {
//   const PopularStores({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: padding4 * 4,
//       ),
//       child: Column(
//         children: [
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             //todo: this will be fetch from the api
//             child: BlocConsumer<StoreCubit, StoreState>(
//               listener: (context, state) {
//                 // TODO: implement listener
//               },
//               builder: (context, state) {
//                 late List<StoreEntity> stores;
//                 if (state is GetAllStoresSuccess) {
//                   stores = state.storesList.data.stores;
//                 }
//                 return Row(
//                   children: [
//                     if (state is GetAllStoresLoading)
//                       ...List.generate(
//                         4,
//                         (index) {
//                           return Row(
//                             children: [
//                               const StoreCard(),
//                               if (index != 3)
//                                 const SizedBox(
//                                   width: padding4 * 5,
//                                 ),
//                             ],
//                           );
//                         },
//                       ),
//                     if (state is GetAllStoresSuccess)
//                       ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: stores.length,
//                         itemBuilder: (context, index) {
//                           return Row(
//                             children: [
//                               StoreCard(
//                                 storeEntity: stores[index],
//                               ),
//                               if (index != (stores.length - 1))
//                                 const SizedBox(
//                                   width: padding4 * 5,
//                                 ),
//                             ],
//                           );
//                         },
//                       ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
