import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/core/class/statusrequest.dart';
import 'package:weatherapp/core/constant/custom_colors.dart';
import 'package:weatherapp/core/constant/routes.dart';
import 'package:weatherapp/screens/weather_creen.dart';
import 'package:weatherapp/widgets/currently/current_weather_widget.dart';
import 'package:weatherapp/widgets/daily/daily_data_forecast.dart';
import 'package:weatherapp/widgets/header_widget.dart';
import 'package:weatherapp/widgets/hourly/hourly_data_widget.dart';

import '../core/class/handlingdataview.dart';
import '../core/constant/app_assets.dart';
import '../core/functions/validinput.dart';
import '../core/utils/screen_size_utils.dart';
import '../widgets/customtextformauth.dart';

//
class HomeScreen extends StatelessWidget {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("weather App"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.searchPage);
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: Obx(() => HandlingDataView(
            statusRequest: globalController.getStatusRequest(),
            mainWidget: WeatherScreen(
              controller: globalController,
            ))),
      ),
    );
  }
}
