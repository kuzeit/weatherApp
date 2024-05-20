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
  List<Weather>? weather;

  Current({
    this.temp,
    this.humidity,
    this.feelsLike,
    this.clouds,
    this.uvIndex,
    this.windSpeed,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: (json['temp'] as num?)?.round(),
        feelsLike: (json['app_temp'] as num?)?.toDouble(),
        humidity: json['rh'] as int?,
        uvIndex: (json['uv'] as num?)?.toDouble(),
        clouds: json['clouds'] as int?,
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
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

// factory Current.fromJson(List json) => Current(
//   temp: json['data'][0]['temp'] as int?,
//   feelsLike: json['data'][0]['app_temp'] as double?,
//   humidity: json['data'][0]['rh'] as int?,
//   uvIndex: json['data'][0]['uv'] as double?,
//   clouds: json['data'][0]['clouds'] as int?,
//   windSpeed: json['data'][0]['wind_spd'] as double?,
//   weather: [
//     Weather.fromJson(json['data'][0]['weather'] as Map<String, dynamic>)
//   ],
// );
// factory Current.fromJson(Map<String, dynamic> json) => Current(
//       // temp: (json['temp'] as num?)?.round(),
//       // feelsLike: (json['feels_like'] as num?)?.toDouble(),
//       // humidity: json['humidity'] as int?,
//       // uvIndex: (json['uvi'] as num?)?.toDouble(),
//       // clouds: json['clouds'] as int?,
//       // windSpeed: (json['wind_speed'] as num?)?.toDouble(),
//       // weather: (json['weather'] as List<dynamic>?)
//
// temp: json['temp'] as int?,
//   feelsLike: json['app_temp'] as double?,
//   humidity: json['rh'] as int?,
//   uvIndex: json['uv'] as double?,
//   clouds: json['clouds'] as int?,
//   windSpeed: json['wind_spd'] as double?,
//   weather: (json['weather'] as List<dynamic>?)
//
//       ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
// factory Current.fromJson(Map<String, dynamic> json) {
//   var data = json['data'][0];
//
//   return Current(
//     temp: data['temp'] as int?,
//     feelsLike: data['app_temp'] as double?,
//     humidity: data['rh'] as int?,
//     uvIndex: data['uv'] as double?,
//     clouds: data['clouds'] as int?,
//     windSpeed: data['wind_spd'] as double?,
//     weather: (data['weather'] as List<dynamic>?)
//         ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
//         .toList(),
//   );
// }
