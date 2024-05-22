import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/core/class/statusrequest.dart';
import 'package:weatherapp/core/constant/app_theme.dart';
import 'package:weatherapp/core/constant/custom_colors.dart';
import 'package:weatherapp/core/constant/routes.dart';
import 'package:weatherapp/screens/weather_creen.dart';
import 'package:weatherapp/widgets/currently/current_weather_widget.dart';
import 'package:weatherapp/widgets/daily/daily_data_forecast.dart';
import 'package:weatherapp/widgets/header_widget.dart';
import 'package:weatherapp/widgets/hourly/hourly_data_widget.dart';

import '../controller/search_controller.dart';
import '../core/class/handlingdataview.dart';
import '../core/constant/app_assets.dart';
import '../core/functions/validinput.dart';
import '../core/utils/screen_size_utils.dart';
import '../widgets/customtextformauth.dart';

//
class searchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchCityController controller = Get.put(SearchCityController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(() => controller.checkSearching().isFalse
            ? Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 9.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Please enter the name of the city you would like to know the weather for",
                      textAlign: TextAlign.center,
                      style: AppTheme.textTheme.bodyText1!
                          .copyWith(fontSize: 13.sp),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2.h),
                      child: CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 1, 100, "username");
                        },
                        mycontroller: controller.searchCity,
                        labeltext: "search",
                        hinttext: "enter city ",
                        iconData: Icons.search,
                        onTapIcon: () {
                          controller.checkSearching().value = true;
                          controller.getCity().value =
                              controller.searchCity.text;
                          controller.getWeatherInformation();
                        },
                      ),
                    ),
                    Image.asset(AppAssets.search)
                  ]
                      .map((e) => Padding(
                            child: e,
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                          ))
                      .toList(),
                ),
              )
            : HandlingDataView(
                statusRequest: controller.getStatusRequest(),
                mainWidget: WeatherScreen(
                  controller: controller,
                ))),
      ),
    );
  }
}
