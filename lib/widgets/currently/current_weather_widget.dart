import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/core/constant/custom_colors.dart';
import 'package:weatherapp/widgets/currently/temprature_area_widget.dart';

import 'current_weather_detailes.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({
    Key? key,
    required this.weatherDataCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Temperature area
        TemperatureAreaWidget(weatherDataCurrent: weatherDataCurrent),

        SizedBox(
          height: 3.6.h,
        ),

        // More details - windspeed, humidity, clouds
        CurrentWeatherMoreDetailsWidget(
          weatherDataCurrent: weatherDataCurrent,
        ),
      ],
    );
  }
}
