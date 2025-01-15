import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../utils/constants/app_numbers.dart';

class MyPlaceHolder extends StatelessWidget {
  const MyPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Construction"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200,
                  maxWidth: 300,
                ),
                child: SvgPicture.asset(
                  AppImages.underConstruction,
                ),
              ),
            ),
            SizedBox(height: padding4 * 9),
            Text(
              "Construction Site!!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: padding4 * 3),
            Text(
              "This page is under construction please go\nout for your safe",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.grayColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
