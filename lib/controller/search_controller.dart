import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:weatherapp/core/functions/fetch_weather.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/core/class/statusrequest.dart';
import 'package:weatherapp/model/weather_data.dart';

class SearchCityController extends GlobalController {
  // create various variables
  late TextEditingController _searchCity;

  final RxBool _onSearch = false.obs;

  TextEditingController get searchCity => _searchCity;

  set searchCity(TextEditingController value) {
    _searchCity = value;
  } // instance for them to be called

  RxBool checkSearching() => _onSearch;

  final weatherData = WeatherData().obs;

  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    _searchCity = TextEditingController();

    getStatusRequest().value = StatusRequest.loading;
     // getStatusRequestHourly.value = StatusRequest.loading;
    // _statusRequestDaily.value = StatusRequest.loading;
  }

  @override
  void dispose() {
    _searchCity.dispose();
    super.dispose();
  }
}
