import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testweather/data/models/weather_daily.dart';

//Подслой уровня данных - network, делаем запрос данных из интернета и возвращаем результат в weather_repositories.
//Получаем текущие данные о погоде по названию города
class WeatherApi {
  Future<String> getWeather(String cityName) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=64565cd9b3cad2d02266409e238e5db2&lang=ru'));
    //Ловим ошибку от сервера, если от сервера получи код 200, то возвращаем данные.
    if (response.statusCode == 200) {
      final weather = response;
      //print(weather.body);
      return weather.body;
    } else {
      //print(response.statusCode);
      throw Exception('Error get weather');
    }
  }

//Получаем ежедневные данные по координатам
  Future<List<WeatherDaily>> getWeatherLocation(
      {required double longitude, required double latitude}) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&units=metric&exclude=current,minutely,hourly,alerts&appid=64565cd9b3cad2d02266409e238e5db2&lang=ru'));
    //Ловим ошибку от сервера, если от сервера получи код 200, то возвращаем данные.
    if (response.statusCode == 200) {
      final weatherJson = json.decode(response.body);
      final List<dynamic> weatherFromDaily = weatherJson['daily'];
      // print(weatherFromDaily.sublist(0, 3));
      return weatherFromDaily
          .sublist(0, 3)
          .map((json) => WeatherDaily.fromJson(json))
          .toList();
    } else {
      throw Exception('Error get weather');
    }
  }
}
