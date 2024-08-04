import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: 'PlayfairDisplay',
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
