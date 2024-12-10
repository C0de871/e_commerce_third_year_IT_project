import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        Text(
          AppLocalizations.of(context)!.appName,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Text(
          textAlign: TextAlign.center,
          widget.text,
        ),
        const Spacer(
          flex: 4,
        ),
        // if (widget.image.contains('.png'))
        Expanded(
          flex:7 ,
          child: Image.asset(
            widget.image,
            // fit: BoxFit.,
            // height: SizeConfig.relativeHeight(300, context),
            // width: SizeConfig.relativeWidth(235 * 2, context),
          ),
        ),
      ],
    );
  }
}
