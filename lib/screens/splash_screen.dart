import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/core/constant/app_assets.dart';
import 'package:weatherapp/core/constant/app_theme.dart';
import 'package:weatherapp/core/constant/routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 6), () {
      Get.offNamed(AppRoute.homepage);
    });

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40.sp, horizontal: 5.sp),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "welcome to Weather App",
            style: AppTheme.textTheme.headline2!.copyWith(fontSize: 18.sp),
          ),
          Image.asset(
            AppAssets.splasScreen,
            height: 60.h,
            width: 97.w,
            fit: BoxFit.cover,
          )
        ]),
        // Add your splash screen UI components here
      ),
      //),
    );
  }
}
