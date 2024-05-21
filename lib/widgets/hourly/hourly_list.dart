import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/widgets/hourly/hourly_detailes.dart';

import '../../../model/weather_data_daily.dart';
import '../../core/constant/custom_colors.dart';
import '../../model/weather_data_hourly.dart';

class HourlyList extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;

  const HourlyList({
    required this.weatherDataHourly,
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

      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //
      //     children: [
      //       for (int i = 0; i < 12; i++)
      //         Expanded(
      //           child: HourlyDetails(
      //             temp: i==0?6666666666666:weatherDataHourly.hourly[i].temp!,
      //             timeStamp: weatherDataHourly.hourly[i].dt!,
      //             weatherIcon: weatherDataHourly.hourly[i].weather![0].icon!,
      //           ),
      //         )
      //     ],
      //   ),
      // ),
    );
  }
}
