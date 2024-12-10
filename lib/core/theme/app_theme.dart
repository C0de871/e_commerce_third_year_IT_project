import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//! current seed color: FF803C
//! cool seed color:DD9D00, 00B1F4, E5C583
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: lightScheme(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: appTextTheme(),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: lightScheme().inversePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    )),
    // textButtonTheme: TextButtonThemeData(style: ),
    inputDecorationTheme: inputDecorationTheme(),
  );

  static TextTheme appTextTheme() {
    return TextTheme(
      labelLarge: ThemeData.light().textTheme.labelLarge!.copyWith(
            color: lightScheme().onSurfaceVariant,
          ),
      displaySmall: ThemeData.light().textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
            
          ),
        displayMedium: ThemeData.light().textTheme.displayMedium!.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
        ),   
      headlineMedium: ThemeData.light().textTheme.headlineMedium!.copyWith(
            height: 1.5,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.cairo().fontFamily,
            leadingDistribution: TextLeadingDistribution.even,
          ),
      titleMedium: ThemeData.light()
          .textTheme
          .titleMedium!
          .copyWith(color: lightScheme().primary),
    );
  }
}

InputDecorationTheme inputDecorationTheme() {
  var outlineEnableInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: lightScheme().outline),
    gapPadding: 10,
  );
  var outlineFocusInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(
      color: lightScheme().primary,
      width: 2,
    ),
    gapPadding: 10,
  );
  var outlineErrorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: lightScheme().error),
    gapPadding: 10,
  );
  var outlineFocusErrorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(
      color: lightScheme().error,
      width: 2,
    ),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      // labelStyle: const TextStyle(color: Colors.black),
      // floatingLabelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      //   if (states.contains(WidgetState.focused)) return TextStyle();
      //   return const TextStyle();
      // }),
      errorMaxLines: 5,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 42,
        vertical: 10,
      ),
      enabledBorder: outlineEnableInputBorder,
      focusedBorder: outlineFocusInputBorder,
      errorBorder: outlineErrorInputBorder,
      focusedErrorBorder: outlineFocusErrorInputBorder);
}

ColorScheme lightScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff8d4d2d),
    surfaceTint: Color(0xff8d4d2d),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffffdbcc),
    onPrimaryContainer: Color(0xff351000),
    secondary: Color(0xff765749),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffffdbcc),
    onSecondaryContainer: Color(0xff2c160b),
    tertiary: Color(0xff665f31),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffede4a9),
    onTertiaryContainer: Color(0xff201c00),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    surface: Color(0xfffff8f6),
    onSurface: Color(0xff221a16),
    onSurfaceVariant: Color(0xff52443d),
    outline: Color(0xff85736c),
    outlineVariant: Color(0xffd7c2ba),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff382e2a),
    inversePrimary: Color(0xffffb694),
    primaryFixed: Color(0xffffdbcc),
    onPrimaryFixed: Color(0xff351000),
    primaryFixedDim: Color(0xffffb694),
    onPrimaryFixedVariant: Color(0xff703718),
    secondaryFixed: Color(0xffffdbcc),
    onSecondaryFixed: Color(0xff2c160b),
    secondaryFixedDim: Color(0xffe6beac),
    onSecondaryFixedVariant: Color(0xff5c4033),
    tertiaryFixed: Color(0xffede4a9),
    onTertiaryFixed: Color(0xff201c00),
    tertiaryFixedDim: Color(0xffd1c88f),
    onTertiaryFixedVariant: Color(0xff4d481c),
    surfaceDim: Color(0xffe8d6d0),
    surfaceBright: Color(0xfffff8f6),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfffff1eb),
    surfaceContainer: Color(0xfffceae3),
    surfaceContainerHigh: Color(0xfff6e5de),
    surfaceContainerHighest: Color(0xfff0dfd8),
  );
}
