import 'package:flutter/material.dart';

import 'app_const.dart';

class AppStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: isDarkTheme ? darkMainPrimaryColor : lightMainPrimaryColor,

      backgroundColor: isDarkTheme ? Colors.white : primaryColor_,

      primaryColor: isDarkTheme ? Colors.black : Colors.white,

      //textSelectionHandleColor: isDarkTheme ? Colors.white : Colors.black,

      indicatorColor:
      isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),

      hintColor: isDarkTheme ? Colors.white : Colors.black,

      //highlightColor: isDarkTheme ? const Color(0xff372901) : Colors.white,

      hoverColor:
      isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),

      focusColor:
      isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),

      disabledColor: Colors.grey,

      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,

      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],

      brightness: isDarkTheme ? Brightness.dark : Brightness.light,

      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),

      splashColor: isDarkTheme ? Colors.white : primaryColor_,

      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),

      scaffoldBackgroundColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,

    );
  }

  static MaterialColor lightMainPrimaryColor = const MaterialColor(
    0xff004aad,
    <int, Color>{
      50: primaryColor_,
      100: primaryColor_,
      200: primaryColor_,
      300: primaryColor_,
      400: primaryColor_,
      500: primaryColor_,
      600: primaryColor_,
      700: primaryColor_,
      800: primaryColor_,
      900: primaryColor_,
    },
  );
  static MaterialColor darkMainPrimaryColor = const MaterialColor(
    0xffffffff,
    <int, Color>{
      50: Colors.white,
      100: Colors.white,
      200: Colors.white,
      300: Colors.white,
      400: Colors.white,
      500: Colors.white,
      600: Colors.white,
      700: Colors.white,
      800: Colors.white,
      900: Colors.white,
    },
  );
}


Color getIconColor(BuildContext context){
  return Theme.of(context).disabledColor;
}

Color getWhite(BuildContext context) {
  return Theme.of(context).primaryColor;
}

Color getBlack(BuildContext context){
  return Theme.of(context).hintColor;
}

Color getPrimaryColor(BuildContext context) {
  return Theme.of(context).splashColor;
}

Color getBackCont(BuildContext context) {
  return Theme.of(context).backgroundColor;
}

Color getScaffCont(BuildContext context) {
  return Theme.of(context).scaffoldBackgroundColor;
}
