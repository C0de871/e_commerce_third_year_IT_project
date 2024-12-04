import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_commerce/core/constants/app_images.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   // List<Map<String,String>>splashData[
  //   {

  //   },
  //   {

  //   },
  //   {

  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: PageView.builder(
                itemBuilder: (context, index) => SplashContent(),
              )),
          const Expanded(flex: 2, child: SizedBox())
        ],
      ),
    )));
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          AppLocalizations.of(context)!.appName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          AppLocalizations.of(context)!.welcome,
        ),
        Image.asset(AppImages.splashImage)
      ],
    );
  }
}
