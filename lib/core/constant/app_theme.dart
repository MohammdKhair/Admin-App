import 'package:admin_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
          fontFamily: "PlayfairDisplay"),
    ),
    fontFamily: "PlayfairDisplay",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          fontSize: 16,
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        fontSize: 16,
        height: 2,
        color: AppColor.grey,
      ),
    ));

ThemeData themeArabic = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
          fontFamily: "Cairo"),
    ),
    fontFamily: "Cairo",
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          fontSize: 16,
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        fontSize: 16,
        height: 2,
        color: AppColor.grey,
      ),
    ));
