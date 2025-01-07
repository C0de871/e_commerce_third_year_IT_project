import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
    required this.width,
  });

  final String text;
  final void Function() press;
  final int width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 56,
      child: TextButton(
        onPressed: press,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
