import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/core/Routes/app_routes.dart';
import 'package:e_commerce/core/utils/constants/app_strings.dart';
import 'package:e_commerce/core/shared/widgets/auth_text_field.dart';
import 'package:e_commerce/core/shared/widgets/defualt_button.dart';
import 'package:e_commerce/features/user/presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompleteYourProfileForm extends StatefulWidget {
  const CompleteYourProfileForm({
    super.key,
  });
  @override
  State<CompleteYourProfileForm> createState() =>
      _CompleteYourProfileFormState();
}

class _CompleteYourProfileFormState extends State<CompleteYourProfileForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthTextField(
            controller: context.read<UserCubit>().signUpFirstNameController,
            label: AppLocalizations.of(context)!.firstName,
            hint: AppLocalizations.of(context)!.enterFirstName,
            svgIconPath: AppImages.emailIconPath,
            validator: (value) => _validateFirstName(context, value),
          ),
          const SizedBox(
            height: padding4 * 8,
          ),
          AuthTextField(
            controller: context.read<UserCubit>().signUpLastNameController,
            label: AppLocalizations.of(context)!.lastName,
            hint: AppLocalizations.of(context)!.enterLastName,
            svgIconPath: AppImages.passwordIconPath,
            validator: (value) => _validateLastName(context, value),
          ),
          const SizedBox(
            height: padding4 * 8,
          ),
          AuthTextField(
            controller: context.read<UserCubit>().signUpAddressController,
            label: AppLocalizations.of(context)!.address,
            hint: AppLocalizations.of(context)!.enterAddress,
            svgIconPath: AppImages.passwordIconPath,
            validator: (value) => _validateAddress(context, value),
          ),
          const SizedBox(
            height: padding4 * 8,
          ),
          AuthTextField(
            controller: context.read<UserCubit>().signUpPhoneNumberController,
            label: AppLocalizations.of(context)!.phoneNumber,
            hint: AppLocalizations.of(context)!.enterPhoneNumber,
            svgIconPath: AppImages.passwordIconPath,
            validator: (value) => _validatePhoneNumber(context, value),
          ),
          const SizedBox(
            height: padding4 * 8,
          ),
          const SizedBox(
            height: padding4 * 9,
          ),
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is SignUpUserFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMessage)),
                );
              }
              if (state is SignUpUserSuccessfully) {
                Navigator.pushNamed(
                  context,
                  AppRoutes.otpRoute,
                );
              }
            },
            builder: (context, state) {
              if (state is SignUpUserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return DefaultButton(
                text: AppLocalizations.of(context)!.continueSignUp,
                press: () {
                  if (_formKey.currentState!.validate()) {
                    userCubit.signUpUserTrigger();
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}

String? _validateFirstName(BuildContext context, String? value) {
  if (value == null || value.trim().isEmpty) {
    return AppLocalizations.of(context)!.firstNameRequired;
  }
  return null; // Valid input
}

String? _validateLastName(BuildContext context, String? value) {
  if (value == null || value.trim().isEmpty) {
    return AppLocalizations.of(context)!.lastNameRequired;
  }
  return null; // Valid input
}

String? _validateAddress(BuildContext context, String? value) {
  if (value == null || value.trim().isEmpty) {
    return AppLocalizations.of(context)!.addressRequired;
  }
  return null; // Valid input
}

String? _validatePhoneNumber(BuildContext context, String? value) {
  if (value == null || value.trim().isEmpty) {
    return AppLocalizations.of(context)!.phoneNumberRequired;
  } else if (!RegExp(r'^09\d{8}$').hasMatch(value)) {
    return AppLocalizations.of(context)!.phoneNumberInvalid;
  }
  return null; // Valid input
}
