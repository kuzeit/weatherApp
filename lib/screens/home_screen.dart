import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/core/class/statusrequest.dart';
import 'package:weatherapp/core/constant/custom_colors.dart';
import 'package:weatherapp/widgets/currently/current_weather_widget.dart';
import 'package:weatherapp/widgets/daily/daily_data_forecast.dart';
import 'package:weatherapp/widgets/header_widget.dart';
import 'package:weatherapp/widgets/hourly/hourly_data_widget.dart';

import '../core/class/handlingdataview.dart';
import '../core/constant/app_assets.dart';
import '../core/utils/screen_size_utils.dart';

//
class HomeScreen extends StatelessWidget {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "weather App",
        ),
      ),
      body: SafeArea(
        child: Obx(() => HandlingDataView(
              statusRequest: globalController.getStatusRequest(),
              mainWidget: globalController.getStatusRequest() ==
                      StatusRequest.success
                  ? Center(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          HeaderWidget(),
                          CurrentWeatherWidget(
                            weatherDataCurrent:
                                globalController.getData().getCurrentWeather(),
                          ),
                          HourlyDataWidget(
                            weatherDataHourly:
                                globalController.getData().getHourlyWeather(),
                          ),
                          //
                          DailyDataForecast(
                            weatherDataDaily:
                                globalController.getData().getDailyWeather(),
                          ),

                          SizedBox(height: 1.0.h),
                          // 568.8888888888889 / 100 * screenHeight
                        ],
                      ),
                    )
                  : Container(),
            )),
      ),
    );
  }
}
