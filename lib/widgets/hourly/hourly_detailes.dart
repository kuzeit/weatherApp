import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/core/utils/api_url.dart';
import 'package:weatherapp/core/constant/custom_colors.dart';

import '../customImageWidget.dart';

class HourlyDetails extends StatelessWidget {
  final int temp;
  final int timeStamp;
  final String weatherIcon;

  HourlyDetails({
    Key? key,
    required this.timeStamp,
    required this.temp,
    required this.weatherIcon,
  }) : super(key: key);

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29.w,
      // 90/320
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      padding: EdgeInsets.symmetric(vertical: 2.h),

      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(100),
        borderRadius: BorderRadius.circular(15.sp), // 12/320
        border: Border.all(
          color: CustomColors.dividerLine.withAlpha(150),
          width: 0.5.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildContainerTextWidget(getTime(timeStamp)),
          Center(
            child: Container(
              margin: EdgeInsets.all(0.15625.w), // 5/320
              child: NetworkImageWidget(
                imageUrl: generateWeatherIconUrl(weatherIcon),
                height: 7.03.h, // 40/568.8888888888889
                width: 12.5.w,  // 40/320
              ),
            ),
          ),
          buildContainerTextWidget("$temp°")
        ],
      ),
    );
  }

  Widget buildContainerTextWidget(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: CustomColors.textColorBlack,
        ),
      ),
    );
  }
}
