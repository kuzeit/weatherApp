import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/constant/app_theme.dart';
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
           child:NetworkImageWidget(
            imageUrl:generateWeatherIconUrl(
                weatherDataCurrent.current.weather![0].icon!),
            height: 16.h,
            width: 35.w,
          ),
        ),
        Container(
          height:16.h,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        Column(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "${weatherDataCurrent.current.temp!.toInt()}°",
                    style:AppTheme.textTheme.headline1

                ),
                TextSpan(
                  text: "C",
                    style:AppTheme.textTheme.bodyText1

                ),
              ]),
            ),
            Text(
              weatherDataCurrent.current.weather![0].description!,
                      style:AppTheme.textTheme.bodyText1

            ), ],
        ),

      ],
    );
  }
}
