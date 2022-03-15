import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testweather/busines_logic/weather_state.dart';
import 'package:testweather/data/models/weather_daily.dart';
import 'package:testweather/data/repositories/weather_rep.dart';

//Расширяем класс WeatherCubit от Cubit, который принимает состояния WeatherState
class WeatherCubit extends Cubit<WeatherState> {
  //Подключаемся к WeatherRepository, для получения данных о погоде
  final WeatherRepository _weatherRepository;
//Передаем в конструктор _weatherRepository, и устанавливаем начальное состояние EmptyState()
  WeatherCubit(this._weatherRepository) : super(EmptyState());

// Cubit работает с функциями, создадим два метода:
  // первый метода отвечает за получение данных о погоде за день
  Future<void> getWeather(String nameCity) async {
    try {
      //отображаем индикатор загрузки
      emit(LoadingState());
      //после того как получим данные о погоде, генерируем состояние LoadedState
      final _weather = await _weatherRepository.getWeatherForCityName(nameCity);
      emit(
        LoadedState(weather: _weather),
      );
    } catch (_) {
      //при получении данных о погоде возникнет ошибка, будем генерировать состояние ErrorState()
      emit(ErrorState());
    }
  }

  // второй метод отвечает за получение данных о погоде за 3 дня
  Future<void> getAllWeatherDaily() async {
    try {
      //отображаем индикатор загрузки
      emit(LoadingState());
      final List<WeatherDaily> _loadedWeatherList =
          await _weatherRepository.getDailyWeather();
      //после того как получим данные о погоде, генерируем состояние LoadedDailyState
      emit(LoadedDailyState(loadedWeather: _loadedWeatherList));
    } catch (_) {
      //при получении данных о погоде возникнет ошибка, будем генерировать состояние ErrorState()
      emit(ErrorState());
    }
  }
}
