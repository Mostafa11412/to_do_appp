import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color primaryColor = Color(0xFF5D9CEC);
  static Color DarkprimaryColor = Color(0xFF141922);

  static ThemeData LightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFDFECDB),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          fontSize: 22.sp, fontWeight: FontWeight.w700, color: primaryColor),
      bodyMedium: GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      displayLarge: GoogleFonts.inter(
        fontSize: 30.sp,
        fontWeight: FontWeight.w100,
      ),
      displayMedium: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
      displaySmall: GoogleFonts.roboto(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.poppins(
          fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF61E757)),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFF5D9CEC),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
    ),
  );

  static ThemeData DarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF060E1E),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF060E1E)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xFF141922)),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          fontSize: 22.sp, fontWeight: FontWeight.w700, color: primaryColor),
      bodyMedium: GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      displayLarge: GoogleFonts.inter(
        fontSize: 30.sp,
        fontWeight: FontWeight.w100,
      ),
      displayMedium: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
      displaySmall: GoogleFonts.roboto(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.poppins(
          fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF61E757)),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFF5D9CEC),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(12.0)), // Adjust the border radius
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
    ),
  );
}
