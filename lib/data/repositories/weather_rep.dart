import 'dart:convert';
import 'package:testweather/data/data_providers/network.dart';
import '../models/weather.dart';

class WeatherRepository {
  WeatherApi api = WeatherApi();

  Future<Weather> getWeatherForCityName(String name) async {
    final rawWeather = await api.getWeather(name);
    final json = jsonDecode(rawWeather);
    final Weather weather = Weather.fromJson(json);
    return weather;
  }
}

// print(weather.name);
// print(weather.icon);
// print(weather.humidity);
// print('speed ' + weather.speed);
// print('temp ' + weather.temp);
// print(weather.latitude + weather.longitude);
// longitude = weather.longitude;
// latitude = weather.latitude;
// getWeatherDaily(longitude: weather.longitude, latitude: weather.latitude);

// final rawWeather = await weatherNetwork.getWeather(name);
// final Weather weather = Weather.fromJson(rawWeather);
// print(weather);
// return weather;

// Future<WeatherDaily> getWeatherDaily(
//     {required double latitude, required double longitude}) async {
//   final rawWeather =
//       await api.getWeatherLocation(latitude: latitude, longitude: longitude);
//   final json = jsonDecode(rawWeather);
//   final WeatherDaily weatherDaily = WeatherDaily.fromJson(json);
//   print('Temp ' + weatherDaily.temp1);
//   final int dayOfWeek =
//       DateTime.fromMillisecondsSinceEpoch(weatherDaily.data1 * 1000).weekday;
//   if (dayOfWeek == 1) {
//     print('понедельник');
//   } else if (dayOfWeek == 2) {
//     print('вторник');
//   } else if (dayOfWeek == 3) {
//     print('среда');
//   } else if (dayOfWeek == 4) {
//     print('четверг');
//   } else if (dayOfWeek == 5) {
//     print('пятница');
//   } else if (dayOfWeek == 6) {
//     print('суббота');
//   } else if (dayOfWeek == 7) {
//     print('воскресенье');
//   }
//   return weatherDaily;
// }
// }

// print(DateTime.fromMillisecondsSinceEpoch(weatherDaily.data1 * 1000));
