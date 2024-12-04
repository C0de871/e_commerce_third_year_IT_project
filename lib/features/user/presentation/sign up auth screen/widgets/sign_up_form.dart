import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/widgets/auth_text_field.dart';
import 'package:e_commerce/core/widgets/defualt_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final emailController = TextEditingController();

// String password;
// String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthTextField(
            controller: emailController,
            label: AppLocalizations.of(context)!.email,
            hint: AppLocalizations.of(context)!.enterYourEmail,
            svgIconPath: AppStrings.emailIconPath,
            validator: (value) => _validateEmail(context, value),
          ),
          SizedBox(
            height: padding4 * 8,
          ),
          AuthTextField(
            label: AppLocalizations.of(context)!.password,
            hint: AppLocalizations.of(context)!.enterYourPassword,
            svgIconPath: AppStrings.passwordIconPath,
            validator: (value) => _validatePassword(context, value),
            controller: passwordController,
            isObsure: true,
          ),
          SizedBox(
            height: padding4 * 8,
          ),
          AuthTextField(
            label: AppLocalizations.of(context)!.confirmPassword,
            hint: AppLocalizations.of(context)!.reEnterYourPassword,
            svgIconPath: AppStrings.passwordIconPath,
            controller: confirmPasswordController,
            validator: (value) => _validateConfirmPassword(
              context,
              passwordController.text,
              value,
            ),
            isObsure: true,
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
                  AppRoutes.signUpCompleteProfileRoute,
                  arguments: emailController.text,
                );
              }
            },
          )
        ],
      ),
    );
  }
}

String? _validateConfirmPassword(
    BuildContext context, String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.trim().isEmpty) {
    return AppLocalizations.of(context)!.thisFieldCannotBeEmpty;
  }
  if (password != confirmPassword) {
    return AppLocalizations.of(context)!.doesNotMatch;
  }
  return null;
}

String? _validateEmail(BuildContext context, String? value) {
  if (value == null || value.trim().trim().isEmpty) {
    return AppLocalizations.of(context)!.thisFieldCannotBeEmpty;
  }
  // Email validation regex
  final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value)) {
    return AppLocalizations.of(context)!.pleaseEnterValidEmail;
  }
  return null; // Return null if the input is valid
}

String? _validatePassword(BuildContext context, String? value) {
  if (value == null || value.trim().isEmpty) {
    return AppLocalizations.of(context)!.passwordIsRequired;
  }
  if (value.length < 8) {
    return AppLocalizations.of(context)!.passwordMustBeAtLeast8Characters;
  }
  if (!RegExp(r'(?=.*[A-Z])(?=.*[a-z])|(?=.*\d)|(?=.*[@$!%*?&])')
      .hasMatch(value)) {
    return AppLocalizations.of(context)!.passwordComplexityRequirement;
  }
  return null;
}
