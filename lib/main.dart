import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/screens/home_screen.dart';

import 'core/constant/app_theme.dart';
import 'core/utils/routes.dart';

void main() {
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType)
    {return GetMaterialApp(
      //home: HomeScreen(),
      title: "Weather",
      theme:AppTheme ,
      debugShowCheckedModeBanner: false,
       getPages: routes,

    );
    },
    );
  }
}

