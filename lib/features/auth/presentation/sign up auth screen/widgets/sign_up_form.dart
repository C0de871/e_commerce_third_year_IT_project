import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/core/Routes/app_routes.dart';
import 'package:e_commerce/core/utils/constants/app_strings.dart';
import 'package:e_commerce/core/shared/widgets/auth_text_field.dart';
import 'package:e_commerce/core/shared/widgets/defualt_button.dart';
import 'package:e_commerce/features/auth/presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
            controller: context.read<UserCubit>().signUpEmailController,
            label: AppLocalizations.of(context)!.email,
            hint: AppLocalizations.of(context)!.enterYourEmail,
            svgIconPath: AppImages.emailIconPath,
            validator: (value) => _validateEmail(context, value),
          ),
          const SizedBox(
            height: padding4 * 8,
          ),
          AnimatedPasswordField(
            controller: context.read<UserCubit>().signUpPasswordController,
            label: AppLocalizations.of(context)!.password,
            hint: AppLocalizations.of(context)!.enterYourPassword,
            svgIconPath: AppImages.passwordIconPath,
            validator: (value) => _validatePassword(context, value),
          ),
          const SizedBox(
            height: padding4 * 8,
          ),
          AnimatedPasswordField(
            label: AppLocalizations.of(context)!.confirmPassword,
            hint: AppLocalizations.of(context)!.reEnterYourPassword,
            svgIconPath: AppImages.passwordIconPath,
            controller:
                context.read<UserCubit>().signUpConfirmPasswordController,
            validator: (value) => _validateConfirmPassword(
              context,
              context.read<UserCubit>().signUpPasswordController.text,
              value,
            ),
          ),
          const SizedBox(
            height: padding4 * 8,
          ),
          const SizedBox(
            height: padding4 * 9,
          ),
          DefaultButton(
            text: AppLocalizations.of(context)!.continueSignUp,
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(
                  context,
                  AppRoutes.signUpCompleteProfileRoute,
                );
              }
            },
            // width: 200,
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
