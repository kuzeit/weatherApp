import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/core/constant/custom_colors.dart';

ThemeData AppTheme = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: CustomColors.white),
    titleTextStyle: TextStyle(color: CustomColors.white, fontSize: 20.sp),
    backgroundColor: CustomColors.firstGradientColor,
  ),
  textTheme: TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 46.sp,
        color: CustomColors.textColorBlack,
      ),
      headline2: TextStyle(fontSize: 25.sp, color: CustomColors.black),
      bodyText2: TextStyle(color: CustomColors.black, fontSize: 15.sp),
      bodyText1: TextStyle(color: CustomColors.black, fontSize: 12.sp)),
  primarySwatch: Colors.blue,
);
