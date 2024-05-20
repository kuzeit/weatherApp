import 'package:weatherapp/api/api_key.dart';

String apiURL(var lat, var lon) {
  String url;

  url =
      "https://api.weatherbit.io/v2.0/current?lat=$lat&lon=$lon&key=$apiKey";
  return url;
 }
 String currentApiURL(var lat, var lon) {
  String url;

  url =
  "https://api.weatherbit.io/v2.0/current?lat=$lat&lon=$lon&key=$apiKey";
  return url;}
String hourlyApiURL(var lat, var lon) {
  String url;

  url =
  "https://api.weatherbit.io/v2.0/forecast/hourly?lat=$lat&lon=$lon&key=$apiKey";
  return url;
 }
String dailyApiURL(var lat, var lon) {
  String url;

  url ="https://api.weatherbit.io/v2.0/forecast/daily?lat=$lat&lon=$lon&key=$apiKey";
  return url;
 }
String generateWeatherIconUrl(String icon) {
  return "https://www.weatherbit.io/static/img/icons/${icon}.png";
}
