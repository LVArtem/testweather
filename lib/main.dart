import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testweather/data/repositories/weather_daily_rep.dart';
import 'package:testweather/data/repositories/weather_rep.dart';
import 'package:testweather/presentation/screens/city_screen.dart';
import 'package:testweather/presentation/screens/current_weather.dart';
import 'package:testweather/presentation/screens/daily_weather.dart';
import 'busines_logic/weather_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherRepository _weatherRepository = WeatherRepository();
    final WeatherDailyRepositories _weatherDailyRepositories =
        WeatherDailyRepositories();
    final WeatherCubit _weatherCubit =
        WeatherCubit(_weatherRepository, _weatherDailyRepositories);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xff082B6D),
        ),
        scaffoldBackgroundColor: const Color(0xff082B6D),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            BlocProvider.value(value: _weatherCubit, child: CityScreen()),
        '/second': (context) =>
            BlocProvider.value(value: _weatherCubit, child: CurrentWeather()),
        '/third': (context) =>
            BlocProvider.value(value: _weatherCubit, child: DailyWeather())
      },
    );
  }
}

//#082B6D
