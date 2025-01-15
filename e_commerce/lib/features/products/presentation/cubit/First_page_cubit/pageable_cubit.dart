// import 'package:bloc/bloc.dart';
// import 'package:e_commerce/features/products/presentation/cubit/product_cubit/product_cubit.dart';
// import 'package:equatable/equatable.dart';

// import '../../../../../core/databases/params/params.dart';
// import '../../../../../core/utils/services/service_locator.dart';
// import '../../../domain/use cases/get_all_products.dart';

// part 'pageable_state.dart';

// class PageableCubit extends Cubit<PageableState> {
//   GetAllProducts getAllProductsUseCase;
//   PageableCubit()
//       : getAllProductsUseCase = getIt<GetAllProducts>(),
//         super(PageableInitial());

//   dynamic getAllProducts() async {
//     emit(PageableLoading());
//     final response = await getAllProductsUseCase.call(params: ProductParams(page: 1));
//     response.fold(
//       (failure) => emit(PageableFailed(errMsg: failure.errMessage)),
//       (getAllProductsEntity) {
//         emit(
//           PageableSuccess(getAllProductsEntity: getAllProductsEntity),
//         );
//       },
//     );
//   }
// }
