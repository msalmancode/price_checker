import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:price_checker/utils/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColorDark: kLightStrokeColor,
  primaryColorLight: kLightFillColor,
  primaryColor: primaryColor,
  primarySwatch: accentColor,
  shadowColor: Colors.white,
  cursorColor: primaryColor,
  cardColor: const Color(0xffF1F3F6),
  bottomAppBarColor: primaryColor,
  dividerColor: kLightDividerColor,
  iconTheme: const IconThemeData(
    color: Color(0xFF3A4276),
  ),
);

MaterialColor accentColor = const MaterialColor(
  0xffdeb134,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: primaryColor,
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);
