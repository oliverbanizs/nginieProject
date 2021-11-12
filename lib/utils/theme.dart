import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    secondaryHeaderColor: primaryColor,
    iconTheme: IconThemeData(color: contentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: contentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: contentColorDarkTheme,
      selectedItemColor: contentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: contentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: primaryColor),
    ),
    inputDecorationTheme: inputDecorationTheme.copyWith(
        fillColor: primaryColor.withOpacity(0.05)),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: contentColorLightTheme,
    appBarTheme: appBarTheme,
    secondaryHeaderColor: contentColorLightTheme,
    iconTheme: IconThemeData(color: contentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: contentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: contentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: contentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: primaryColor),
    ),
    inputDecorationTheme: inputDecorationTheme,
  );
}

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: contentColorDarkTheme.withOpacity(0.08),
  contentPadding: EdgeInsets.symmetric(
      horizontal: defaultPadding * 1.5, vertical: defaultPadding),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: const BorderRadius.all(Radius.circular(50)),
  ),
);
