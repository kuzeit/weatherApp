import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/model/weather_data_daily.dart';
import 'package:weatherapp/core/constant/custom_colors.dart';
import 'package:weatherapp/widgets/daily/daily_list.dart';

import '../../core/constant/app_theme.dart';
import '../../core/utils/api_url.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  DailyDataForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  // string manipulation

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0.h,
      margin: EdgeInsets.symmetric(horizontal: 3.w,vertical:4.h ),
      padding: EdgeInsets.symmetric(horizontal: 6.w,vertical:3.h ),

       decoration: BoxDecoration(
        color: CustomColors.dividerLine.withOpacity(0.7),
        borderRadius: BorderRadius.circular(6.0.w),
      ),
      child: Column(
        children: [
           Container(
            alignment: Alignment.topLeft,
             child: Text(
              "Next Days",
                 style:AppTheme.textTheme.bodyText2

             ),
          ),
DailyList(weatherDataDaily: weatherDataDaily)        ],
      ),
    );
  }
}
