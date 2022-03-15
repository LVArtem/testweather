//Подслой уровня данных weather_rep, взаимодействующий с другими частями уровня данных
import 'dart:convert';
import 'package:testweather/data/data_providers/network.dart';
import 'package:testweather/data/models/weather_daily.dart';
import '../models/weather.dart';

class WeatherRepository {
  //Переменные содержащие координаты, для метода getDailyWeather()
  late double lat;
  late double lon;
//Создаем экземпляр класса WeatherApi
  WeatherApi api = WeatherApi();
  //Создаем метод, который принимает название города и возвращает экземпляр Weather
  Future<Weather> getWeatherForCityName(String name) async {
    final rawWeather = await api.getWeather(name);
    final json = jsonDecode(rawWeather);
    final Weather weather = Weather.fromJson(json);
    // print('lon ${weather.longitude}');
    // print('lat ${weather.latitude}');
    //Обращаемся к экземпляру weather и получаем координаты
    lat = weather.latitude;
    lon = weather.longitude;
    return weather;
  }

//Создаем метод, который возвращает список с данными о погоде за 3 дня
  Future<List<WeatherDaily>> getDailyWeather() =>
      api.getWeatherLocation(longitude: lon, latitude: lat);
}
