import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/databases/params/params.dart';
import '../../../../core/utils/services/service_locator.dart';
import '../../domain/entities/toggle_fav_on_entitiy.dart';
import '../../domain/service/product_favorite_service.dart';
import '../../domain/usecases/toggle_fav_on.dart';

part 'toggle_fav_on_state.dart';

class ToggleFavOnCubit extends Cubit<ToggleFavOnState> {
  ToggleFavOn toggleFavOnUseCase;
  final ProductFavoriteService _favoriteService;
  ToggleFavOnCubit()
      : toggleFavOnUseCase = getIt<ToggleFavOn>(),
        _favoriteService = getIt(),
        super(ToggleFavOnInitial());

  toggleFavOnTrigger({required int storeID, required int productID}) async {
    ToggleFavOnParams params = ToggleFavOnParams(
      productID: productID.toString(),
      storeID: storeID.toString(),
    );
    _favoriteService.updateProductFavoriteStatus(isFavorite: 1, params: params);
    emit(ToggleFavOnLoading());
    final response = await toggleFavOnUseCase.call(params: params);
    response.fold(
      (failure) {
        emit(ToggleFavOnFailure(msg: failure.errMessage));
      },
      (toggleFavOnEntity) {
        emit(ToggleFavOnSuccess(toggleFavOnEntity: toggleFavOnEntity));
      },
    );
  }
}
