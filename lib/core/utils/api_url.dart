import 'package:weatherapp/api/api_key.dart';

String currentApiURL(var lat, var lon, String city) {
  String url;

  url =lat==0.0&&lon==0.0
      ? "https://api.weatherbit.io/v2.0/current?city=$city&key=$apiKey"
      : "https://api.weatherbit.io/v2.0/current?lat=$lat&lon=$lon&key=$apiKey";
  return url;
}

String hourlyApiURL(var lat, var lon, String city) {
  String url;

  url = lat==0.0&&lon==0.0
      ? "https://api.weatherbit.io/v2.0/forecast/hourly?city=$city&key=$apiKey"
      : "https://api.weatherbit.io/v2.0/forecast/hourly?lat=$lat&lon=$lon&key=$apiKey";
  return url;
}

String dailyApiURL(var lat, var lon, String city) {
  String url;
  url = lat==0.0&&lon==0.0
      ? "https://api.weatherbit.io/v2.0/forecast/daily?city=$city&key=$apiKey"
      : "https://api.weatherbit.io/v2.0/forecast/daily?lat=$lat&lon=$lon&key=$apiKey";
  return url;
}

String generateWeatherIconUrl(String icon) {
  return "https://www.weatherbit.io/static/img/icons/${icon}.png";
}
