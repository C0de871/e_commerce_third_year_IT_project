import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: lightScheme(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headlineMedium: ThemeData.light().textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.5,
            fontFamily: GoogleFonts.cairo().fontFamily,
          ),
    ),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    // borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // labelStyle: const TextStyle(color: Colors.black),
    // floatingLabelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    //   if (states.contains(WidgetState.focused)) return TextStyle();
    //   return const TextStyle();
    // }),

    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

ColorScheme lightScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffa04100),
    surfaceTint: Color(0xffa04100),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffff803c),
    onPrimaryContainer: Color(0xff300e00),
    secondary: Color(0xff96481e),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffffa77d),
    onSecondaryContainer: Color(0xff541e00),
    tertiary: Color(0xff695f00),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffb6a717),
    onTertiaryContainer: Color(0xff1e1b00),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    surface: Color(0xfffcf8f8),
    onSurface: Color(0xff1c1b1b),
    onSurfaceVariant: Color(0xff5a4136),
    outline: Color(0xff8e7164),
    outlineVariant: Color(0xffe2bfb0),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff313030),
    inversePrimary: Color(0xffffb693),
    primaryFixed: Color(0xffffdbcc),
    onPrimaryFixed: Color(0xff351000),
    primaryFixedDim: Color(0xffffb693),
    onPrimaryFixedVariant: Color(0xff7a3000),
    secondaryFixed: Color(0xffffdbcc),
    onSecondaryFixed: Color(0xff351000),
    secondaryFixedDim: Color(0xffffb693),
    onSecondaryFixedVariant: Color(0xff783207),
    tertiaryFixed: Color(0xfff6e556),
    onTertiaryFixed: Color(0xff1f1c00),
    tertiaryFixedDim: Color(0xffd9c93c),
    onTertiaryFixedVariant: Color(0xff4f4800),
    surfaceDim: Color(0xffddd9d9),
    surfaceBright: Color(0xfffcf8f8),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff6f3f2),
    surfaceContainer: Color(0xfff1edec),
    surfaceContainerHigh: Color(0xffebe7e7),
    surfaceContainerHighest: Color(0xffe5e2e1),
  );
}
