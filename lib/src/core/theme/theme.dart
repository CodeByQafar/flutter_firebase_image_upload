import 'package:firebase_image_upload/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
static ThemeData get theme=>ThemeData(
  primaryColor:  AppColors.aLOrange,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: AppColors.aLOrange,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
  ),
  splashColor: AppColors.aLOrange.withOpacity(0.5),

  cardTheme: CardThemeData(
    
  color: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: AppColors.aLOrange,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(20),
    
    ),
  ),
  tabBarTheme:  TabBarThemeData(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: AppColors.aLOrange,
        width: 1,
      ),
    ),
    labelColor: AppColors.aLOrange,
    unselectedLabelColor: Colors.grey,
  ),
);
}


