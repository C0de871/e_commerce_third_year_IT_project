import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/databases/api/end_points.dart';
import '../../../../core/helper/app_functions.dart';
import '../../../../core/utils/services/service_locator.dart';
import '../../domain/entites/Sign up entities/sign_up_entity.dart';
import '../../domain/entites/otp_entities/otp_entity.dart';
import '../../domain/entites/user_entities/user_entities.dart';
import '../../domain/usecases/login_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  //!iniialize the usecases:
  LoginUser loginUser;

  UserCubit()
      : loginUser = getIt<LoginUser>(),
        super(UserInitial());
  // maybe this is reason of error

  //!login ui textfield controllers:
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  //!login trigger:
  dynamic loginUserTrigger() async {
    Map<String, dynamic> bodyjson = {
      ApiKey.email: loginEmailController.text,
      ApiKey.password: loginPasswordController.text,
    };
    emit(LoginUserLoading());
    final failureOrUser = await loginUser.call(bodyjson: bodyjson);
    failureOrUser.fold(
      (failure) => emit(LoginUserFailure(errMessage: failure.errMessage)),
      (user) => emit(
        LoginUserSuccessfully(user: user),
      ),
    );
  }



}
