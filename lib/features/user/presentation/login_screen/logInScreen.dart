import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/widgets/auth_text_field.dart';
import 'package:e_commerce/core/widgets/defualt_button.dart';
import 'package:e_commerce/features/user/presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.login,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: padding4 * 5),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: padding4 * 12,
                ),
                Text(AppLocalizations.of(context)!.welcomeBack,
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(
                  AppLocalizations.of(context)!.signInMessage,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: padding4 * 12,
                ),
                const LoginForm(),
                SizedBox(
                  height: padding4 * 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dontHaveAccount,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.outline),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUpauthRoute);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signUp,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
            validator: (value) {
              return _validateEmail(context, value);
            },
          ),
          SizedBox(
            height: padding4 * 8,
          ),
          AuthTextField(
            controller: passwordController,
            label: AppLocalizations.of(context)!.password,
            hint: AppLocalizations.of(context)!.enterYourPassword,
            svgIconPath: AppStrings.passwordIconPath,
            isObsure: true,
            validator: (value) {
              return _validatePassword(context, value);
            },
          ),
          SizedBox(
            height: padding4 * 12,
          ),
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is LoginUserFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMessage)),
                );
              }
            },
            builder: (context, state) {
              if (state is LoginUserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return DefaultButton(
                text: AppLocalizations.of(context)!.login,
                press: () {
                  if (_formKey.currentState!.validate()) {
                    print("object");
                    context.read<UserCubit>().eitherFailureOrUser(
                        emailController.text, passwordController.text);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  String? _validateEmail(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
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
    return null;
  }
}
