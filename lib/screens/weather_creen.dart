import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/core/class/statusrequest.dart';

import '../widgets/currently/current_weather_widget.dart';
import '../widgets/daily/daily_data_forecast.dart';
import '../widgets/header_widget.dart';
import '../widgets/hourly/hourly_data_widget.dart';

class WeatherScreen extends StatelessWidget {
  final GlobalController controller;

  const WeatherScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: //controller.getStatusRequest() == StatusRequest.success.obs
            Center(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          HeaderWidget(
            city: controller.getCity().value,
          ),
          CurrentWeatherWidget(
            weatherDataCurrent: controller.getData().getCurrentWeather(),
          ),
          HourlyDataWidget(
            weatherDataHourly: controller.getData().getHourlyWeather(),
          ),
          //
          DailyDataForecast(
            weatherDataDaily: controller.getData().getDailyWeather(),
          ),

          SizedBox(height: 1.0.h),
          // 568.8888888888889 / 100 * screenHeight
        ],
      ),
    )
        // : Container(),
        );
  }
}
