import 'dart:developer';

import 'package:e_commerce/core/databases/api/end_points.dart';
import 'package:e_commerce/core/functions/app_functions.dart';
import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/features/user/domain/entites/Sign%20up%20entities/sign_up_entity.dart';
import 'package:e_commerce/features/user/domain/entites/otp_entities/otp_entity.dart';
import 'package:e_commerce/features/user/domain/entites/user_entities/user_entities.dart';
import 'package:e_commerce/features/user/domain/usecases/login_user.dart';
import 'package:e_commerce/features/user/domain/usecases/post_otp.dart';
import 'package:e_commerce/features/user/domain/usecases/resend_otp.dart';
import 'package:e_commerce/features/user/domain/usecases/sign_up_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  //!iniialize the usecases:
  LoginUser loginUser;
  SignUpUser signUpUser;
  ResendOtp resendOtp;
  PostOtp postOtp;

  UserCubit()
      : loginUser = getIt<LoginUser>(),
        signUpUser = getIt<SignUpUser>(),
        resendOtp = getIt<ResendOtp>(),
        postOtp = getIt<PostOtp>(),
        super(UserInitial());

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

  //!sign up ui textfields controllers:
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpFirstNameController = TextEditingController();
  TextEditingController signUpLastNameController = TextEditingController();
  TextEditingController signUpPhoneNumberController = TextEditingController();
  TextEditingController signUpAddressController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();

  //!Sign up trigger:
  dynamic signUpUserTrigger() async {
    Map<String, dynamic> bodyjson = {
      ApiKey.email: signUpEmailController.text,
      ApiKey.password: signUpPasswordController.text,
      ApiKey.address: signUpAddressController.text,
      ApiKey.phoneNumber: signUpPhoneNumberController.text,
      ApiKey.firstName: signUpFirstNameController.text,
      ApiKey.lastName: signUpLastNameController.text,
      ApiKey.imageUrl: await uploadImageToApi(profilePic),
    };
    emit(SignUpUserLoading());
    final failureOrSignUpEntity = await signUpUser.call(jsonBody: bodyjson);
    failureOrSignUpEntity.fold(
      (failure) => emit(SignUpUserFailure(errMessage: failure.errMessage)),
      (signUpEntity) => emit(
        SignUpUserSuccessfully(signUpEntity: signUpEntity),
      ),
    );
  }

  XFile? profilePic;
  uploadProfilePic(XFile? image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  //! otp textField controller:
  TextEditingController otpController = TextEditingController();

  //! Otp triger:
  dynamic resendOtpTrigger() async {
    Map<String, dynamic> bodyjson = {
      ApiKey.email: signUpEmailController.text,
    };
    emit(OtpUserLoading());
    final failureOrResendOtpEntity = await resendOtp.call(bodyjson: bodyjson);
    failureOrResendOtpEntity.fold(
      (failure) => emit(OtpUserFailure(errMessage: failure.errMessage)),
      (otpEntity) => emit(
        OtpUserSuccessfully(otpEntity: otpEntity),
      ),
    );
  }

  dynamic postOtpTrigger() async {
    Map<String, dynamic> bodyjson = {
      ApiKey.email: signUpEmailController.text,
      ApiKey.otp: otpController.text,
    };
    emit(OtpUserLoading());
    final failureOrResendOtpEntity = await postOtp.call(bodyjson: bodyjson);
    failureOrResendOtpEntity.fold(
      (failure) => emit(OtpUserFailure(errMessage: failure.errMessage)),
      (otpEntity) => emit(
        OtpUserSuccessfully(otpEntity: otpEntity),
      ),
    );
  }

  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
    log("$change");
  }
}
