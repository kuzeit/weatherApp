import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/model/weather_data_daily.dart';
import 'package:weatherapp/model/weather_data_hourly.dart';
import 'package:weatherapp/core/utils/api_url.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/checkinternet.dart';
import '../core/functions/get_data.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;
  Rx<StatusRequest> statusRequest = StatusRequest.success.obs;

  processData(double lat, double lon) async {
    var currentUrl = currentApiURL(lat, lon);
    var hourlyUrl = hourlyApiURL(lat, lon);
    var dailyUrl = dailyApiURL(lat, lon);

    var currentResponse = await getdata(currentUrl);
    var hourlyResponse = await getdata(hourlyUrl);
    var dailyResponse = await getdata(dailyUrl);

    print("Current JSONfdgfghfgh: $currentResponse");
    print("===================================\n");

    print("Hourly JSONfghfghfgh: $hourlyResponse");
    print("===================================\n");

    print("Daily JSONdfgdfhdgh: $dailyResponse");
    print("===================================\n");
    if (!(currentResponse is StatusRequest &&
        dailyResponse is StatusRequest &&
        hourlyResponse is StatusRequest))
      statusRequest.value = StatusRequest.success;
    else
      handlingData(currentResponse);

    if (statusRequest == StatusRequest.success) {
      WeatherDataCurrent currentWeather =
          WeatherDataCurrent.fromJson(currentResponse);
      WeatherDataHourly hourlyWeather =
          WeatherDataHourly.fromJson(hourlyResponse);
      WeatherDataDaily dailyWeather = WeatherDataDaily.fromJson(dailyResponse);

      weatherData = WeatherData(currentWeather, hourlyWeather, dailyWeather);
      return weatherData;
    } else
      return statusRequest;
  }

  handlingData(response) {
    if (response is StatusRequest) {
      statusRequest = response.obs;
    } else {
      statusRequest = StatusRequest.success.obs;
    }
  }

  getdata(String AppLink) async {
    var response = await getDataResponse(AppLink);
    return response.fold((l) => l, (r) => r);
  }
}
