import 'dart:developer';

import 'package:e_commerce/core/shared/widgets/custom_surfix_icon.dart';
import 'package:e_commerce/core/utils/constants/app_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.svgIconPath,
    this.controller,
    this.isObsure = false,
    this.validator,
  });
  final String label, hint, svgIconPath;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isObsure;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      obscureText: widget.isObsure,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 64,
          minHeight: 64,
          maxWidth: 68,
          minWidth: 68,
        ),
        labelText: widget.label,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        hintText: widget.hint,
        suffixIcon: CustomSuffixIcon(svgIcon: widget.svgIconPath),
      ),
    );
  }
}

class AnimatedPasswordField extends StatefulWidget {
  const AnimatedPasswordField({
    super.key,
    required this.label,
    required this.hint,
    required this.svgIconPath,
    this.controller,
    this.validator,
  });
  final String label, hint, svgIconPath;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  State<AnimatedPasswordField> createState() => _AnimatedPasswordField();
}

class _AnimatedPasswordField extends State<AnimatedPasswordField> {
  StateMachineController? controller;
  Artboard? artboard;
  SMIBool? isHiddenSMI;
  bool isHidden = true;

  @override
  void initState() {
    log("init animated password filed state");
    rootBundle.load(AppRive.riveIcons).then((value) async {
      await RiveFile.initialize();
      final file = RiveFile.import(value);
      final art = file.artboardByName("Icon / Lock / Unlock");
      controller = StateMachineController.fromArtboard(art!, "State Machine 1");
      if (controller != null) {
        art.addController(controller!);
        log("${controller!.inputs}");
        for (var input in controller!.inputs) {
          if (input is SMIBool) {
            log("is SMI bool");
            isHiddenSMI = input;
          } else if (input is SMINumber) {
            log("is SMI Number");
          } else if (input is SMITrigger) {
            log("is SMI Trigger");
          } else {
            log("NO input found!");
          }
        }
        isHiddenSMI!.value = !isHidden;
        setState(() {
          artboard = art;
          log("set STate");
        });
      }
    });

    super.initState();
  }

  void _togglePasswordVisibility() {
    setState(() {
      isHidden = !isHidden; // Update local state
      isHiddenSMI!.value = !isHidden; // Update Rive input
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      obscureText: isHidden,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 64,
          minHeight: 64,
          maxWidth: 68,
          minWidth: 68,
        ),
        labelText: widget.label,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        hintText: widget.hint,
        suffixIcon: GestureDetector(
          onTap: _togglePasswordVisibility,
          child: CustomAnimatedLockIcon(
            artboard: artboard,
          ),
        ),
      ),
    );
  }
}
