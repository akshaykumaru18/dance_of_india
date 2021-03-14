import 'package:flutter/material.dart';

class ThemeDataStyle {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.red,
        primaryColor: isDarkTheme ? Colors.black : Colors.white,
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        accentColor: isDarkTheme ? Colors.white : Colors.black,
        //indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
        indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
        buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
        hintColor: isDarkTheme ? Colors.white70 : Colors.black26,
        highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
        hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: isDarkTheme ? Colors.white : Colors.black,
        ),
       // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),

        disabledColor: Colors.grey,
        cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:
                isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: isDarkTheme ? Colors.black : Colors.white,

        ),
        dividerColor: isDarkTheme ? Colors.white : Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          focusedBorder: InputBorder.none
        ),

        textTheme: TextTheme(
            headline1: TextStyle(
                fontFamily: "Roboto-Bold",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: isDarkTheme ? Colors.white : Colors.black,letterSpacing: 1),
            headline3: TextStyle(
                fontFamily: "Roboto-Medium",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: isDarkTheme ? Colors.white : Colors.black),
            headline6: TextStyle(
                fontFamily: "Roboto-Black",
                fontSize: 18,
                color: isDarkTheme ? Colors.white : Colors.black)));
  }
}
