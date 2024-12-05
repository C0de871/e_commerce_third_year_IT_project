import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/user/domain/usecases/login_user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  LoginUser loginUser;
  UserCubit()
      : loginUser = getIt<LoginUser>(),
        super(UserInitial());

  eitherFailureOrUser(String email, String password) async {
    Map<String, dynamic> bodyjson = {
      ApiKey.email: email,
      ApiKey.password: password
    };
    emit(LoginUserLoading());
    final failureOrUser = await loginUser.call(bodyjson: bodyjson);
    failureOrUser.fold(
        (failure) => emit(LoginUserFailure(errMessage: failure.errMessage)),
        (user) => emit(LoginUserSuccessfully(user: user)));
  }
  @override
  void onChange(Change<UserState> change) {
    
    super.onChange(change);
    print(change);
  }
}
