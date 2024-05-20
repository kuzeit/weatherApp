import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/core/constant/custom_colors.dart';
import 'package:weatherapp/widgets/hourly/hourly_list.dart';

import '../../controller/global_controller.dart';
import '../../model/weather_data_hourly.dart';
import '../../core/utils/api_url.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../model/weather_data_daily.dart';
import '../../core/utils/api_url.dart';
import '../../core/constant/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  // ...

  final WeatherDataHourly weatherDataHourly;

  HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);
  RxInt cardIndex = GlobalController().getIndex();

//
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 7.h,
          child: Center(
            child: Text(
              "Today",
              style: TextStyle(fontSize: 15.sp), // 18/320
            ),
          ),
        ),
        HourlyList(weatherDataHourly: weatherDataHourly, cardIndex: cardIndex)
      ],
    );
  }
}
