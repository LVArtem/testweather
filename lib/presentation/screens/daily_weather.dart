//Экран 3 - отображаем иформацию о погоде за три дня

import 'package:flutter/material.dart';
import 'package:testweather/presentation/widgets/weather_list.dart';

class DailyWeather extends StatelessWidget {
  const DailyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            //Возвращаемся к экрану с вводом названия города
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
      //Создадим список с данными о погоде и вынесем его в отдельный файл weather_list
      body: WeatherList(),
    );
  }
}
