import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_quiz/utils/constants.dart';

class AppThemes {
  ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Janna',
      scaffoldBackgroundColor: const Color(0xfff5f7fa),
      colorScheme: const ColorScheme.light(
        primary: appPrimaryColor,
        error: appErrorColor,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: appPrimaryColor,
      ),
      dividerTheme: const DividerThemeData(thickness: .3, color: Colors.grey),
      listTileTheme: const ListTileThemeData(
        tileColor: Colors.white,
      ),
      useMaterial3: true,
    );
  }
}
