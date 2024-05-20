import 'package:weatherapp/model/weather.dart';

class WeatherDataHourly {
  List<Hourly> hourly;

  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(
          hourly: List<Hourly>.from(json['data']
              .map((e) => Hourly.fromJson(e as Map<String, dynamic>))));
}

class Hourly {
  int? dt;
  int? temp;
  List<Weather>? weather;

  Hourly({this.dt, this.temp, this.weather});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      dt: json['ts'] as int?,
      temp: (json['temp'] as num?)?.round(),
      weather: json['weather'] is List<dynamic>
          ? (json['weather'] as List<dynamic>)
              ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList()
          : [Weather.fromJson(json['weather'] as Map<String, dynamic>)],
    );
  }

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}
