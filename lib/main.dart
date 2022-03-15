import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testweather/data/repositories/weather_rep.dart';
import 'package:testweather/presentation/screens/city_screen.dart';
import 'package:testweather/presentation/screens/current_weather.dart';
import 'package:testweather/presentation/screens/daily_weather.dart';
import 'busines_logic/weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final WeatherRepository _weatherRepository = WeatherRepository();
  //Создаем уникальный экземпляр Cubit
  late final WeatherCubit _weatherCubit = WeatherCubit(_weatherRepository);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xff1976d2),
        ),
        scaffoldBackgroundColor: const Color(0xff1976d2),
      ),
      //Определяем какой экран будет начальным, при запуске приложения
      initialRoute: '/',
      //Определяем доступные маршруты
      routes: {
        //С помощью BlocProvider.value предоставляем доступ к WeatherCubit на всех экранах
        '/': (context) =>
            BlocProvider.value(value: _weatherCubit, child: CityScreen()),
        '/second': (context) =>
            BlocProvider.value(value: _weatherCubit, child: CurrentWeather()),
        '/third': (context) =>
            BlocProvider.value(value: _weatherCubit, child: DailyWeather())
      },
    );
  }

//Вызываем функцию закрытия Cubit
  @override
  void dispose() {
    _weatherCubit.close();
    super.dispose();
  }
}
