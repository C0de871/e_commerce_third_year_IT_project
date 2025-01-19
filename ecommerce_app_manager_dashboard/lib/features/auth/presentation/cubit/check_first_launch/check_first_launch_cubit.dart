
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/services/service_locator.dart';
import '../../../domain/usecases/is_first_launch.dart';
import '../../../domain/usecases/set_first_launch.dart';

part 'check_first_launch_state.dart';

class CheckFirstLaunchCubit extends Cubit<CheckFirstLaunchState> {
  final IsFirstLaunch isFirstLaunchUseCase;
  final SetFirstLaunch setFirstLaunchUseCase;
  CheckFirstLaunchCubit()
      : isFirstLaunchUseCase = getIt(),
        setFirstLaunchUseCase = getIt(),
        super(CheckFirstLaunchInitial());

  Future<void> checkFirstLaunch() async {
    emit(CheckFirstLaunchLoading());
    final response = await isFirstLaunchUseCase.call();
    response.fold(
      (failure) {
        emit(CheckFirstLaunchFailed(errMsg: failure.errMessage));
      },
      (isFirstLaunch) {
        emit(CheckFirstLaunchLoaded(isFirstLaunch: isFirstLaunch));
      },
    );
  }

  Future<void> setFirstLaunch() async {
    emit(CheckFirstLaunchLoading());
    final response = await setFirstLaunchUseCase.call();
    response.fold(
      (failure) {
        emit(CheckFirstLaunchFailed(errMsg: failure.errMessage));
      },
      (isFirstLaunch) {
        emit(CheckFirstLaunchLoaded(isFirstLaunch: isFirstLaunch));
      },
    );
  }
}
