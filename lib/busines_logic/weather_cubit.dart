import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testweather/busines_logic/weather_state.dart';
import 'package:testweather/data/models/weather_daily.dart';
import 'package:testweather/data/repositories/weather_daily_rep.dart';
import 'package:testweather/data/repositories/weather_rep.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  final WeatherDailyRepositories _weatherDailyRepositories;
  WeatherCubit(this._weatherRepository, this._weatherDailyRepositories)
      : super(EmptyState());

  Future<void> getWeather(String nameCity) async {
    final _weather = await _weatherRepository.getWeatherForCityName(nameCity);
    emit(
      LoadedState(weather: _weather),
    );
    // print(_weather.temp);
  }

  Future<void> getAllWeatherDaily() async {
    // try {
    // emit(LoadingState());
    final List<WeatherDaily> _loadedWeatherList =
        await _weatherDailyRepositories.getDailyWeather();

    emit(LoadedDailyState(loadedWeather: _loadedWeatherList));
    // }
    // catch (_) {
    //   emit(ErrorState());
    // }
  }
}
