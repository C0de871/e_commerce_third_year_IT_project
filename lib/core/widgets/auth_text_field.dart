import 'package:e_commerce/core/widgets/custom_surfix_icon.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  AuthTextField({
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
  bool isObsure;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: isObsure,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 64,
          minHeight: 64,
          maxWidth: 68,
          minWidth: 68,
        ),
        labelText: label,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        hintText: hint,
        suffixIcon: CustomSuffixIcon(svgIcon: svgIconPath),
      ),
    );
  }
}
