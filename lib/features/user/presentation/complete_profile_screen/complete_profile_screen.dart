import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/features/user/presentation/complete_profile_screen/widgets/complete_your_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.signUp,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: padding4 * 5),
          child: Column(
            children: [
              SizedBox(height: padding4 * 12),
              Text(
                AppLocalizations.of(context)!.completeProfile,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                AppLocalizations.of(context)!.completeYourProfileDetails,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding4 * 12),
              CompleteYourProfileForm(email: email)
            ],
          ),
        ),
      ),
    );
  }
}
