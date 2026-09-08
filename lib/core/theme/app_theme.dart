import 'package:flutter/material.dart';

import 'app_pallete.dart';



class AppTheme {
  static  _border([Color color = AppPallete.borderColor]) =>  OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(20)
  );

  static final darkThemeMode = ThemeData(colorScheme:ColorScheme.fromSeed(
      seedColor: AppPallete.backgroundColor,brightness: Brightness.dark),
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(27),
        enabledBorder:_border(),
        focusedBorder: _border(AppPallete.gradient2),
      ),
      appBarTheme:AppBarTheme(backgroundColor: AppPallete.backgroundColor,),
  chipTheme: ChipThemeData(color:WidgetStatePropertyAll(AppPallete.backgroundColor)
 , side :const BorderSide(color: AppPallete.borderColor),));


  static final lightThemeMode = ThemeData(colorScheme: ColorScheme.fromSeed(
      seedColor: AppPallete.whiteColor,brightness: Brightness.light),
      scaffoldBackgroundColor: AppPallete.whiteColor
  );
}