import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//! current seed color: FF803C
//! cool seed color:DD9D00, 00B1F4, E5C583
class AppTheme {
  ThemeData theme(ColorScheme colorScheme) {
    TextButtonThemeData textButtonStyle = TextButtonThemeData(
        style: TextButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: colorScheme.inversePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ));

    InputDecorationTheme inputDecorationTheme() {
      var outlineEnableInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(
          color: colorScheme.outline,
        ),
        gapPadding: 10,
      );
      var outlineFocusInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 2,
        ),
        gapPadding: 10,
      );
      var outlineErrorInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(
          color: colorScheme.error,
        ),
        gapPadding: 10,
      );
      var outlineFocusErrorInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(
          color: colorScheme.error,
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

    TextTheme appTextTheme = TextTheme(
      labelLarge: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.labelLarge!.copyWith(
                color: colorScheme.onSurfaceVariant,
              )
          : ThemeData.light().textTheme.labelLarge!.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
      displaySmall: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
              )
          : ThemeData.light().textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
              ),
      displayMedium: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
              )
          : ThemeData.light().textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.notoNastaliqUrdu().fontFamily,
              ),
      headlineMedium: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.headlineMedium!.copyWith(
                height: 1.5,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.cairo().fontFamily,
                leadingDistribution: TextLeadingDistribution.even,
              )
          : ThemeData.light().textTheme.headlineMedium!.copyWith(
                height: 1.5,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.cairo().fontFamily,
                leadingDistribution: TextLeadingDistribution.even,
              ),
      titleMedium: colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme.titleMedium!.copyWith(
                color: colorScheme.primary,
              )
          : ThemeData.light().textTheme.titleMedium!.copyWith(
                color: colorScheme.primary,
              ),
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.brightness == Brightness.dark
          ? defaultDarkScheme().surface
          : Colors.white,
      // scaffoldBackgroundColor: darkScheme().su,
      textTheme: appTextTheme,
      textButtonTheme: textButtonStyle,
      // textButtonTheme: TextButtonThemeData(style: ),
      inputDecorationTheme: inputDecorationTheme(),
    );
  }
}

// ColorScheme syriaFreeScheme = ColorScheme.fromSeed(
//   seedColor: Colors.green,
// );

ColorScheme defaultLightScheme() {
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

ColorScheme defaultDarkScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffffb694),
    surfaceTint: Color(0xffffb694),
    onPrimary: Color(0xff542104),
    primaryContainer: Color(0xff703718),
    onPrimaryContainer: Color(0xffffdbcc),
    secondary: Color(0xffe6beac),
    onSecondary: Color(0xff432a1e),
    secondaryContainer: Color(0xff5c4033),
    onSecondaryContainer: Color(0xffffdbcc),
    tertiary: Color(0xffd1c88f),
    onTertiary: Color(0xff363107),
    tertiaryContainer: Color(0xff4d481c),
    onTertiaryContainer: Color(0xffede4a9),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff1a120e),
    onSurface: Color(0xfff0dfd8),
    onSurfaceVariant: Color(0xffd7c2ba),
    outline: Color(0xffa08d85),
    outlineVariant: Color(0xff52443d),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xfff0dfd8),
    inversePrimary: Color(0xff8d4d2d),
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
    surfaceDim: Color(0xff1a120e),
    surfaceBright: Color(0xff423732),
    surfaceContainerLowest: Color(0xff140c09),
    surfaceContainerLow: Color(0xff221a16),
    surfaceContainer: Color(0xff271e1a),
    surfaceContainerHigh: Color(0xff322824),
    surfaceContainerHighest: Color(0xff3d332e),
  );
}
