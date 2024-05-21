import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:weatherapp/core/functions/fetch_weather.dart';
import 'package:weatherapp/core/class/statusrequest.dart';
import 'package:weatherapp/model/weather_data.dart';

class GlobalController extends GetxController {
  // create various variables
  final Rx<StatusRequest> _statusRequest = StatusRequest.none.obs;

  // final Rx<StatusRequest> _statusRequestHourly = StatusRequest.none.obs;
  // final Rx<StatusRequest> _statusRequestDaily = StatusRequest.none.obs;
  // Rx<StatusRequest> getStatusRequestHourly() {
  //   return _statusRequestHourly;
  // }
  //
  // Rx<StatusRequest> getStatusRequestDaily() {
  //   return _statusRequestDaily;
  // }

  late TextEditingController _searchCity;

  final RxBool _onSearch = false.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  RxString _city = "".obs;

  TextEditingController get searchCity => _searchCity;

  set searchCity(TextEditingController value) {
    _searchCity = value;
  } // instance for them to be called

  RxBool checkSearching() => _onSearch;

  RxDouble getLattitude() => _lattitude;

  RxDouble getLongitude() => _longitude;

  RxString getCity() => _city;

  Rx<StatusRequest> getStatusRequest() {
    print("_statusRequest   $_statusRequest");
    return _statusRequest;
  }

  final weatherData = WeatherData().obs;

  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    {
      _statusRequest.value = StatusRequest.loading;
      getLocation();
    }
    _searchCity = TextEditingController();
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    } else {
      print('Location services are disabled');
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      // Update latitude and longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      print("value.latitude: ${value.latitude}");
      print("value.longitude: ${value.longitude}");
      getWeatherInformation();
      // Reverse geocoding

      // Fetch weather data
    });
  }

  getWeatherInformation() {
    return processData(this).then((value) {
      if (value is WeatherData) {
        weatherData.value = value;
        setCity();
      }
    });
  }

  @override
  void dispose() {
    _searchCity.dispose();
    super.dispose();
  }

  setCity() {
    _city.value = weatherData.value.current?.current.city ?? ' ';
  }
 }
