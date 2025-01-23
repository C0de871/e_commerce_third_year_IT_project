import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/Routes/app_routes.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/shared/widgets/defualt_button.dart';
import '../../../../core/utils/constants/app_numbers.dart';
import '../cubit/get_last_user_cubit/get_last_user_cubit.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: Text(AppLocalizations.of(context)!.successScreen),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
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
                    if (context.read<GetLastUserCubit>().state is! UserLoaded) {
                      context.read<GetLastUserCubit>().getLastUser();
                    }
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.addProducts,
                      (route) => false,
                    );
                  },
                  width: double.infinity,
                ),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
