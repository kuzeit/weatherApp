import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/widgets/hourly/hourly_detailes.dart';

import '../../../model/weather_data_daily.dart';
import '../../core/utils/api_url.dart';
import '../../core/constant/custom_colors.dart';
import '../../model/weather_data_hourly.dart';

class HourlyList extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  final RxInt cardIndex;

  const HourlyList({
    required this.weatherDataHourly,
    required this.cardIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h, // 160/568.8888888888889
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 14
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return HourlyDetails(
             temp: weatherDataHourly.hourly[index].temp!,
            timeStamp: weatherDataHourly.hourly[index].dt!,
            weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
          );
        },
      ),
    );
  }
}
