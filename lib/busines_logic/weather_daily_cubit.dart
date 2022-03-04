// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:testweather/busines_logic/weather_daily_state.dart';
// import 'package:testweather/data/models/weather_daily.dart';
// import 'package:testweather/data/repositories/weather_daily_rep.dart';
//
// class WeatherDailyCubit extends Cubit<WeatherDailyState> {
//   final WeatherDailyRepositories _weatherDailyRepositories;
//   WeatherDailyCubit(this._weatherDailyRepositories)
//       : super(
//           EmptyState(),
//         );
//
//   Future<void> getAllWeatherDaily() async {
//     try {
//       emit(LoadingState());
//       final List<WeatherDaily> _loadedWeatherList =
//           await _weatherDailyRepositories.getDailyWeather();
//       emit(LoadedState(loadedWeather: _loadedWeatherList));
//     } catch (_) {
//       emit(ErrorState());
//     }
//   }
// }
