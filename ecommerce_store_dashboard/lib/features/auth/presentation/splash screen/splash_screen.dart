import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/Routes/app_routes.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/shared/widgets/defualt_button.dart';
import '../../../../core/utils/constants/app_numbers.dart';
import '../cubit/check_first_launch/check_first_launch_cubit.dart';
import 'splash_content.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashData = [
      {
        "text": AppLocalizations.of(context)!.welcome,
        "image": AppImages.splashImage1,
      },
      {
        "text": AppLocalizations.of(context)!.splash2word,
        "image": AppImages.splashImage2,
      },
      {
        "text": AppLocalizations.of(context)!.splash3word,
        "image": AppImages.splashImage3,
      }
    ];
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    text: splashData[index]["text"]!,
                    image: splashData[index]["image"]!,
                  ),
                ),
              ),
              const SizedBox(
                height: padding4 * 2,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        )),
                    const Spacer(
                      flex: 3,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: padding4 * 5),
                      child: DefaultButton(
                        text: AppLocalizations.of(context)!.continueSplash,
                        press: () async {
                          context
                              .read<CheckFirstLaunchCubit>()
                              .setFirstLaunch();
                          if (context.mounted) {
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.loginRoute);
                          }
                        },
                        // width: 200,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    )));
  }

  AnimatedContainer buildDot({index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(right: padding4),
      height: padding4,
      width: currentPage == index ? padding4 * 5 : padding4,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Theme.of(context).colorScheme.inversePrimary
            : Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(padding4),
      ),
    );
  }
}
