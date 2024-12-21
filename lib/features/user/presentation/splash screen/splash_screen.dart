import 'package:e_commerce/core/utils/constants/app_numbers.dart';
import 'package:e_commerce/core/shared/widgets/defualt_button.dart';
import 'package:e_commerce/features/user/presentation/splash%20screen/splash_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_commerce/core/utils/constants/app_images.dart';

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage=0;
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
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              onPageChanged: (value){
                setState(() {
                  currentPage=value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                text: splashData[index]["text"]!,
                image: splashData[index]["image"]!,
              ),
            ),
          ),
          SizedBox(
            height: padding4*2,
          )
          ,Expanded(flex: 2, child:
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                splashData.length,
                (index) => buildDot(index:index),
              )),
              const Spacer(
                flex: 3,
              ),
              DefaultButton(text:AppLocalizations.of(context)!.continueSplash , press: (){
                //Todo Navigator the next page
              }),
              const Spacer(
                flex: 2,
              )
            ],
          ),)
        ],
      ),
    )));
  }

  AnimatedContainer buildDot({index}) {
    return AnimatedContainer(
      duration:kThemeAnimationDuration ,
      margin: EdgeInsets.only(right: padding4),
      height: padding4,
      width: currentPage==index ? padding4*5 : padding4,
      decoration: BoxDecoration(
        color: currentPage==index ?  Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(padding4),
      ),
    );
  }
}
