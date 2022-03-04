import 'package:testweather/data/data_providers/network.dart';
import 'package:testweather/data/models/weather_daily.dart';

class WeatherDailyRepositories {
  WeatherApi api = WeatherApi();
  Future<List<WeatherDaily>> getDailyWeather() =>
      api.getWeatherLocation(longitude: 38.8969, latitude: 47.2362);
}
