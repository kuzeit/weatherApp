import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/model/weather_data_daily.dart';
import 'package:weatherapp/model/weather_data_hourly.dart';
import 'package:weatherapp/core/utils/api_url.dart';

import '../class/statusrequest.dart';
import 'checkinternet.dart';
import 'get_data.dart';
import 'handingdatacontroller.dart';

processData(GlobalController controller) async {
  double lat = controller.getLattitude().value;
  double lon = controller.getLongitude().value;
  String city = controller.getCity().value;

  WeatherData weatherData;
  var currentUrl = currentApiURL(lat, lon, city);
  var hourlyUrl = hourlyApiURL(lat, lon, city);
  var dailyUrl = dailyApiURL(lat, lon, city);
  print("currentUrl : $currentUrl");
  print("===================================\n");

  print("hourlyUrl : $hourlyUrl");
  print("===================================\n");

  print("dailyUrl : $dailyUrl");
  print("===================================\n");

  var currentResponse = await getdata(currentUrl);
  var hourlyResponse = await getdata(hourlyUrl);
  var dailyResponse = await getdata(dailyUrl);

  print("Current  : $currentResponse");
  print("===================================\n");

  print("Hourly  : $hourlyResponse");
  print("===================================\n");

  print("Daily  : $dailyResponse");
  print("===================================\n");
  if (currentResponse is! StatusRequest &&
      dailyResponse is! StatusRequest &&
      hourlyResponse is! StatusRequest) {
    controller.getStatusRequest().value = StatusRequest.success;
  } else if (handlingData(currentResponse) == StatusRequest.offlinefailure ||
      handlingData(dailyResponse) == StatusRequest.offlinefailure ||
      handlingData(hourlyResponse) == StatusRequest.offlinefailure) {
    controller.getStatusRequest().value = StatusRequest.offlinefailure;
  } else if (handlingData(currentResponse) == StatusRequest.serverfailure ||
      handlingData(dailyResponse) == StatusRequest.serverfailure ||
      handlingData(hourlyResponse) == StatusRequest.serverfailure) {
    controller.getStatusRequest().value = StatusRequest.serverfailure;
  }
  print(
      "status request_____________________====================================${controller.getStatusRequest().value}");
  if (controller.getStatusRequest() == StatusRequest.success) {
    WeatherDataCurrent currentWeather =
        WeatherDataCurrent.fromJson(currentResponse);
    WeatherDataHourly hourlyWeather =
        WeatherDataHourly.fromJson(hourlyResponse);
    WeatherDataDaily dailyWeather = WeatherDataDaily.fromJson(dailyResponse);

    weatherData = WeatherData(currentWeather, hourlyWeather, dailyWeather);
    return weatherData;
  } else
    return controller.getStatusRequest();
}
