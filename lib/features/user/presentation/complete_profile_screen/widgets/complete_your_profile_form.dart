import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/widgets/auth_text_field.dart';
import 'package:e_commerce/core/widgets/defualt_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompleteYourProfileForm extends StatefulWidget {
  const CompleteYourProfileForm({super.key, required this.email});
  final String email;
  @override
  State<CompleteYourProfileForm> createState() => _CompleteYourProfileFormState();
}

class _CompleteYourProfileFormState extends State<CompleteYourProfileForm> {
  final _formKey = GlobalKey<FormState>();
// String password;
// String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthTextField(
            label: AppLocalizations.of(context)!.firstName,
            hint: AppLocalizations.of(context)!.enterFirstName,
            svgIconPath: AppStrings.emailIconPath,
            validator: (value) => _validateFirstName(context, value),
          ),
          SizedBox(
            height: padding4 * 8,
          ),
          AuthTextField(
            label: AppLocalizations.of(context)!.lastName,
            hint: AppLocalizations.of(context)!.enterLastName,
            svgIconPath: AppStrings.passwordIconPath,
            validator: (value) => _validateLastName(context, value),
          ),
          SizedBox(
            height: padding4 * 8,
          ),
          AuthTextField(
            label: AppLocalizations.of(context)!.address,
            hint: AppLocalizations.of(context)!.enterAddress,
            svgIconPath: AppStrings.passwordIconPath,
            validator: (value) => _validateAddress(context, value),
          ),
          SizedBox(
            height: padding4 * 8,
          ),
          AuthTextField(
            label: AppLocalizations.of(context)!.phoneNumber,
            hint: AppLocalizations.of(context)!.enterPhoneNumber,
            svgIconPath: AppStrings.passwordIconPath,
            validator: (value) => _validatePhoneNumber(context, value),
          ),
          SizedBox(
            height: padding4 * 8,
          ),
          SizedBox(
            height: padding4 * 9,
          ),
          DefaultButton(
            text: AppLocalizations.of(context)!.continueSignUp,
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(
                  context,
                  AppRoutes.otpRoute,
                  arguments: widget.email,
                );
              }
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
