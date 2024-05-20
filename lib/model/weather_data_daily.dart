import 'package:weatherapp/model/weather.dart';

class WeatherDataDaily {
  List<Daily> daily;

  WeatherDataDaily({required this.daily});

  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) =>
      WeatherDataDaily(
          daily: List<Daily>.from(json['data'].map((e) => Daily.fromJson(e))));
}

class Daily {
  String? dt;
  int? minTemp;
  int? maxTemp;

  List<Weather>? weather;

  Daily({
    this.dt,
    this.minTemp,
    this.maxTemp,
    this.weather,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
      dt: json['datetime'] as String?,
      minTemp: (json['min_temp'] as num?)?.round(),
      maxTemp: (json['max_temp'] as num?)?.round(),
      weather: [Weather.fromJson(json['weather'] as Map<String, dynamic>)]);

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'min_temp': minTemp,
        'max_temp': maxTemp,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}
