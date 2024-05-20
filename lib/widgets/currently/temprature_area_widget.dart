import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/weather_data_current.dart';
import '../../core/utils/api_url.dart';
import '../../core/constant/custom_colors.dart';
import '../customImageWidget.dart';

class TemperatureAreaWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const TemperatureAreaWidget({
    required this.weatherDataCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: NetworkImageWidget(
            imageUrl: generateWeatherIconUrl(
                weatherDataCurrent.current.weather![0].icon!),
            height: 16.h,
            width: 35.w,
          ),
        ),
        Container(
          height: 16.h,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        Column(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "${weatherDataCurrent.current.temp!.toInt()}°",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 46.sp,
                    color: CustomColors.textColorBlack,
                  ),
                ),
                TextSpan(
                  text: "C",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: CustomColors.textColorBlack,
                  ),
                ),
              ]),
            ),
            Text(
              weatherDataCurrent.current.weather![0].description!,
              style: TextStyle(
                fontSize: 12.sp,
                color: CustomColors.textColorBlack,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
