// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
//
// import 'package:get/get.dart';
// import 'package:weatherapp/api/fetch_weather.dart';
// import 'package:weatherapp/core/class/statusrequest.dart';
// import 'package:weatherapp/model/weather_data.dart';
// class GlobalController extends GetxController {
//   Rx<StatusRequest> _staturRequest = StatusRequest.none.obs;
//
//   final   RxDouble _lattitude = 0.0.obs;
//   final RxDouble _longitude = 0.0.obs;
//   final RxInt _currentIndex = 0.obs;
//   RxString _city = "".obs;
//   RxDouble getLattitude() => _lattitude;
//   RxDouble getLongitude() => _longitude;
//   RxString getCity() => _city;
//   Rx<StatusRequest> getStatusRequest() {
//     print("_statusRequest---------- *******  ${_staturRequest}");
//     return _staturRequest;
//   }
//
//   final weatherData = WeatherData().obs;
//
//   WeatherData getData() {
//     return weatherData.value;
//   }
//
//   @override
//   void onInit() {
//     if (_staturRequest==StatusRequest.none) {
//       _staturRequest.value=StatusRequest.loading;
//
//       getLocation();
//     } else {
//       getIndex();
//     }
//     super.onInit();
//   }
//
//   getLocation() async {
//     bool isServiceEnabled;
//     LocationPermission locationPermission;
//
//     isServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     // return if service is not enabled
//     if (!isServiceEnabled) {
//       return Future.error("Location not enabled");
//     }
//
//     // status of permission
//     locationPermission = await Geolocator.checkPermission();
//
//     if (locationPermission == LocationPermission.deniedForever) {
//       return Future.error("Location permission are denied forever");
//     } else if (locationPermission == LocationPermission.denied) {
//       // request permission
//       locationPermission = await Geolocator.requestPermission();
//       if (locationPermission == LocationPermission.denied) {
//         return Future.error("Location permission is denied");
//
//       }
//     } else {
//       print('Location services are disabled');
//     }
//
//
//
//     // getting the currentposition
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high)
//         .then((value) async {
//       print("LocationAccuracy : ${LocationAccuracy.high}");
//
//       // update our lattitude and longitude
//       _lattitude.value = value.latitude;
//       _longitude.value = value.longitude;
//       print("value.latitude : ${value.latitude}");
//       print("LocationAccuracy : ${value.longitude}");
//       return FetchWeatherAPI()
//           .processData(value.latitude, value.longitude)
//           .then((value) {
//         if(value is WeatherData ) {
//           _staturRequest = StatusRequest.success.obs;
//
//           weatherData.value = value;
//         }
//         else _staturRequest=value;
//         print("_statusRequest  afterrrrfgfgfghfghfghfghfgh ${_staturRequest.value}");
//       });
//     });
//   }
//   RxInt getIndex() {
//     return _currentIndex;
//   }
//
//
// }
