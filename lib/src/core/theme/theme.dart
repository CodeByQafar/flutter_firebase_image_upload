import 'package:firebase_image_upload/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: AppColors.aLOrange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.aLOrange,
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
   colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.aLOrange,
      primary: AppColors.aLOrange,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.aLOrange,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.aLOrange, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.aLOrange, width: 1),
      ),
      labelColor: AppColors.aLOrange,
      unselectedLabelColor: Colors.grey,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),

      //delete text
      bodyMedium: TextStyle(fontSize: 18),
      //confirm text
    ),
  );
}
