import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:weatherapp/api/fetch_weather.dart';
import 'package:weatherapp/core/class/statusrequest.dart';
import 'package:weatherapp/model/weather_data.dart';

class GlobalController extends GetxController {
  // create various variables
  Rx<StatusRequest> _statusRequest = StatusRequest.none.obs;

  //final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;
  RxString _city = "".obs;

  // instance for them to be called
  //RxBool checkLoading() => _isLoading;
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
    if (_statusRequest == StatusRequest.none.obs) {
      _statusRequest.value = StatusRequest.loading;
      getLocation();
    } else {
      getIndex();
    }
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

      // Reverse geocoding
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(value.latitude, value.longitude);
        if (placemarks.isNotEmpty) {
          String cityName = placemarks[0].locality ?? '';
          print("City Name: $cityName");
          // Do something with cityName, such as pass it to the API request
        }
      } catch (e) {
        print("Error during reverse geocoding: $e");
      }

      // Fetch weather data
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        if (value is WeatherData) {
          weatherData.value = value;
          _statusRequest.value = StatusRequest.success;
        } else {
          _statusRequest.value = value.value;
        }
      });
    });}
  RxInt getIndex() {
    return _currentIndex;
  }
}
