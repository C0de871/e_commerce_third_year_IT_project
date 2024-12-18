import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/core/constants/app_routes.dart';
import 'package:e_commerce/core/widgets/defualt_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Text(AppLocalizations.of(context)!.successScreen),
      ),
      body: Column(
        children: [
          Image.asset(
            AppImages.successImage,
            height: padding4 * 110,
          ),
          Text(AppLocalizations.of(context)!.successLogin,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontFamily: GoogleFonts.marhey().fontFamily,
                  )),
          const Spacer(
            flex: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding4 * 5),
            child: DefaultButton(
                text: AppLocalizations.of(context)!.backToHome,
                press: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.homeRoute,
                    (route) => false,
                  );
                }),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
