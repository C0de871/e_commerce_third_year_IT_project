import 'package:e_commerce/core/constants/app_strings.dart';
import 'package:e_commerce/core/widgets/custom_surfix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpGeneralInfoScreen extends StatelessWidget {
  const SignUpGeneralInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signUp),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.registerAccount,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              AppLocalizations.of(context)!.completeYourdetails,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24,),
            const SignUpForm(),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
// String password;
// String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateEmail,
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.email,
              hintText: AppLocalizations.of(context)!.enterYourEmail,
              suffixIcon: CustomSuffixIcon(svgIcon: AppStrings.emailIconPath),
            ),
          )
        ],
      ),
    );
  }
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'This field cannot be empty';
  }
  // Email validation regex
  final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null; // Return null if the input is valid
}
