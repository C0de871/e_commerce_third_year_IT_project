import 'dart:developer';

import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/core/Routes/app_routes.dart';
import 'package:e_commerce/core/shared/widgets/Pin%20Put%20Template/only_bottom_cursor_pin_put.dart';
import 'package:e_commerce/core/shared/widgets/defualt_button.dart';
import 'package:e_commerce/features/user/presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart'; // Add the localization package
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    final email = userCubit.signUpEmailController.text;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!
              .otpVerification, // Use localized text here
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: padding4 * 12),
              Text(
                AppLocalizations.of(context)!
                    .otpVerification, // Use localized text here
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: padding4 * 2,
              ),
              Text(
                AppLocalizations.of(context)!.verificationCodeSent(
                  email,
                ), // Use localized text with parameter
                textAlign: TextAlign.center,
              ),
              buildTimer(),
              const SizedBox(height: padding4 * 12),
              const OnlyBottomCursor(),
              const SizedBox(
                height: padding4 * 12,
              ),
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is OtpUserFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errMessage)),
                    );
                  } else if (state is OtpUserSuccessfully) {
                    log("pop");
                    Navigator.of(context).popUntil(
                      ModalRoute.withName(AppRoutes.loginRoute),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is OtpUserLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      DefaultButton(
                        text: AppLocalizations.of(context)!
                            .continueText, // Use localized text here
                        press: () {
                          context.read<UserCubit>().postOtpTrigger();
                        },
                      ),
                      const SizedBox(height: padding4 * 6),
                      GestureDetector(
                        onTap: () {
                          context.read<UserCubit>().resendOtpTrigger();
                        },
                        child: Text(
                          AppLocalizations.of(context)!
                              .resendOtp, // Use localized text here
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    int totalTimeInSeconds = 5 * 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context)!.resendIn), // Use localized text here
        TweenAnimationBuilder(
          tween: Tween(begin: totalTimeInSeconds.toDouble(), end: 0.0),
          duration: Duration(seconds: totalTimeInSeconds),
          builder: (context, value, child) {
            int remainingTimeInSeconds = value.toInt();
            int remainingMinutes = remainingTimeInSeconds ~/ 60;
            int remainingSeconds = remainingTimeInSeconds % 60;

            String formattedTime =
                '${remainingMinutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

            return Text(
              formattedTime,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            );
          },
          onEnd: () {},
        ),
      ],
    );
  }
}
