import 'package:e_commerce/features/auth/presentation/sign%20up%20auth%20screen/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/constants/app_numbers.dart';

class SignUpAuthScreen extends StatelessWidget {
  const SignUpAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.signUp),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: padding4 * 5),
          child: Column(
            children: [
              const SizedBox(height: padding4 * 12),
              Text(
                AppLocalizations.of(context)!.registerAccount,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                AppLocalizations.of(context)!.completeYourdetails,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: padding4 * 12),
              const SignUpForm(),
              const SizedBox(
                height: padding4 * 4,
              ),
              Text(
                AppLocalizations.of(context)!.byContinuingYouAgreeTo,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
