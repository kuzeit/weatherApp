import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../model/weather_data_daily.dart';
import '../../core/utils/api_url.dart';
import '../../core/constant/custom_colors.dart';
import '../customImageWidget.dart';

class DailyList extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const DailyList({required this.weatherDataDaily});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 93.75.w,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 5
            ? 5
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 10.56.h,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 25.0.w,
                      child: Text(
                        getDay(weatherDataDaily.daily[index].dt),
                        style: TextStyle(
                          color: CustomColors.textColorBlack,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 9.375.h,
                        width: 9.375.w,
                        child: NetworkImageWidget(
                            imageUrl: generateWeatherIconUrl(weatherDataDaily
                                .daily[index].weather![0].icon!))),
                    Text(
                      "${weatherDataDaily.daily[index].maxTemp}°/${weatherDataDaily.daily[index].minTemp}",
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              ),
            ],
          );
        },
      ),
    );
  }

  String getDay(final day) {
    DateTime date = DateTime.parse(day);
    String dayOfWeek = DateFormat('EEE').format(date);

    return dayOfWeek;
  }
}
