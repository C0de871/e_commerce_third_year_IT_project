import 'package:e_commerce/core/utils/constants/constant.dart';
import 'package:e_commerce/features/settings/presentation/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            if (state is CurrentLanguage) {
              return AnimatedToggleSwitch<String>.size(
                  textDirection: TextDirection.ltr,
                  current: state.lang,
                  values: const ["en", Constant.deviceLang, 'ar'],
                  iconOpacity: 0.2,
                  indicatorSize: const Size.fromWidth(120),
                  customIconBuilder: (context, local, global) {
                    final languageText = {
                          "en": AppLocalizations.of(context)!.english,
                          "ar": AppLocalizations.of(context)!.arabic,
                          Constant.deviceLang:
                              AppLocalizations.of(context)!.systemDefault,
                        }[local.value] ??
                        AppLocalizations.of(context)!.failed;
                    return Text(
                      languageText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.lerp(
                          Theme.of(context).colorScheme.onSurface,
                          Theme.of(context).colorScheme.onInverseSurface,
                          local.animationValue,
                        ),
                        fontSize: 14,
                      ),
                    );
                  },
                  borderWidth: 5,
                  iconAnimationType: AnimationType.onHover,
                  style: ToggleStyle(
                    indicatorColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    borderColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  selectedIconScale: 1,
                  onChanged: (value) {
                    context.read<LanguageCubit>().saveLang(value);
                  });
            }
            return Text(AppLocalizations.of(context)!.failed);
          },
        ),
      ),
    );
  }
}
