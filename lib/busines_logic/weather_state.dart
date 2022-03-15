import 'package:testweather/data/models/weather.dart';

//Перечисляем все возможные состоояния на экране
abstract class WeatherState {}

//Когда данные еще не запрошены:
class EmptyState extends WeatherState {}

//Когда происходит запрос от сервиса:
class LoadingState extends WeatherState {}

//Когда данные загружены:
// - для одного дня
class LoadedState extends WeatherState {
  final Weather weather;
  LoadedState({required this.weather});
}

// - на три дня
class LoadedDailyState extends WeatherState {
  List<dynamic> loadedWeather;
  LoadedDailyState({required this.loadedWeather});
}

//Когда произошла ошибка загрузки данных:
class ErrorState extends WeatherState {}
