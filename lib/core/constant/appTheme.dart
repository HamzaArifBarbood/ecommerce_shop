import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

ThemeData themeEnglish = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundcolor,
    fontFamily: 'PlayfairDisplay',
    appBarTheme: AppBarTheme(
       backgroundColor: AppColors.backgroundcolor,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.secondColor),
    elevation: 0,
    titleTextStyle: TextStyle(color: AppColors.secondColor,fontFamily: "Cairo", fontWeight: FontWeight.bold,fontSize: 25 )
    ),
    textTheme: TextTheme(

        headlineSmall: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: AppColors.grey),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: AppColors.balck),
        bodySmall: TextStyle(
            height: 2,
            fontSize: 16,
            color: AppColors.grey,
            fontWeight: FontWeight.bold)),
    primarySwatch: Colors.blue);
ThemeData themeArabic = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundcolor,
appBarTheme: AppBarTheme(
       backgroundColor: AppColors.backgroundcolor,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.secondColor),
    elevation: 0,
    titleTextStyle: TextStyle(color: AppColors.secondColor,fontFamily: "Cairo", fontWeight: FontWeight.bold,fontSize: 25 )
    ),
    fontFamily: 'Cairo',
    textTheme: TextTheme(
        headlineSmall: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: AppColors.balck),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: AppColors.balck),
        bodySmall: TextStyle(
            height: 2,
            fontSize: 16,
            color: AppColors.grey,
            fontWeight: FontWeight.bold)),
    primarySwatch: Colors.blue);
