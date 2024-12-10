import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:e_commerce/core/widgets/Pin%20Put%20Template/only_bottom_cursor_pin_put.dart';
import 'package:e_commerce/core/widgets/defualt_button.dart';
import 'package:flutter/material.dart'; // Add the localization package
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(this.email, {super.key});
  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.otpVerification, // Use localized text here
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
          child: Column(children: [
            SizedBox(height: padding4 * 12),
            Text(
              AppLocalizations.of(context)!.otpVerification, // Use localized text here
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: padding4 * 2,
            ),
            Text(
              AppLocalizations.of(context)!.verificationCodeSent(widget.email), // Use localized text with parameter
              textAlign: TextAlign.center,
            ),
            buildTimer(),
            SizedBox(height: padding4 * 12),
            const OnlyBottomCursor(),
            SizedBox(
              height: padding4 * 12,
            ),
            DefaultButton(
              text: AppLocalizations.of(context)!.continueText, // Use localized text here
              press: () {},
            ),
            SizedBox(height: padding4 * 6),
            GestureDetector(
              onTap: () {
                //todo: resend OTP code!
              },
              child: Text(
                AppLocalizations.of(context)!.resendOtp, // Use localized text here
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ]),
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

            String formattedTime = '${remainingMinutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';

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
