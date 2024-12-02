import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../constants/app_numbers.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    super.key,
    required this.svgIcon,
  });

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: padding4 * 5,
        right: padding4 * 5,
        top: padding4 * 4,
        bottom: padding4 * 4,
      ),
      child: SvgPicture.asset(
        svgIcon,
      ),
    );
  }
}
