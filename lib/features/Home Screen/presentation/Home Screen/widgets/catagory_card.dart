import 'package:e_commerce/core/constants/app_numbers.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/widgets/tool_tip.dart';

class CatagoryCard extends StatelessWidget {
  const CatagoryCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  // final List<Map<String, dynamic>> categories;
  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  // color: const Color(0xffffecdf),
                  color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: padding4 * 2,
            ),
            TextAutoTooltip(
              textAlign: TextAlign.center,
              text: text,
              tooltipText: text,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
