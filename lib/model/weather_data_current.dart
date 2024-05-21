// instance for getting the api response
import 'package:weatherapp/model/weather.dart';

class WeatherDataCurrent {
  final Current current;

  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(
          current: Current.fromJson(json['data'][0] as Map<String, dynamic>));
}

class Current {
  int? temp;
  int? humidity;
  int? clouds;
  double? uvIndex;
  double? feelsLike;
  double? windSpeed;
  String? city;
  List<Weather>? weather;

  Current(
      {this.temp,
      this.humidity,
      this.feelsLike,
      this.clouds,
      this.uvIndex,
      this.windSpeed,
      this.weather,
      this.city});

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        feelsLike: (json['app_temp'] as num?)?.toDouble(),
        humidity: json['rh'] as int?,
        uvIndex: (json['uv'] as num?)?.toDouble(),
        clouds: json['clouds'] as int?,
        city: json['city_name'] as String?,
        windSpeed: (json['wind_spd'] as num?)?.toDouble(),
        weather: [Weather.fromJson(json['weather'] as Map<String, dynamic>)],
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'uvi': uvIndex,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        "city_name": city,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

