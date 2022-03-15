//Экран 2 - Отображаем детальную информация о погоде в выбранном городе (температура, влажность, скорость ветра).

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testweather/busines_logic/weather_cubit.dart';
import 'package:testweather/busines_logic/weather_state.dart';
import 'package:testweather/presentation/widgets/reusable_card.dart';
import 'package:testweather/presentation/widgets/string_extension.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //Создаем кнопку перехода на третий экран
          actions: [
            TextButton(
              onPressed: () {
                //Вызываем метод getAllWeatherDaily
                context.read<WeatherCubit>().getAllWeatherDaily();
                //Переходим на экран 3
                Navigator.pushNamed(context, '/third');
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            )
          ],
        ),
        //Перестраиваем интерфейс с помощью BlocConsumer при изменении WeatherCubit
        body: BlocConsumer<WeatherCubit, WeatherState>(
            //С помощью listener реализуем SnackBar с текстом "Ошибка" при возникновении состояния ErrorState
            listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.black12,
              content: Text(
                'Ошибка',
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(milliseconds: 1000),
            ));
          }
        },
            //С помощью builder перестраиваем интерфейс, когда генерируется новое состояние
            builder: (context, state) {
          //Если сгенерировано состояние LoadingState, возвращаем индикатор загрузки
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          //Если сгенерировано состояние LoadedState возвращаем данные полученные данные о погоде
          if (state is LoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  //Получаем название города
                  child: Text(
                    state.weather.name,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0x20D6D6D6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //Получаем погодую иконку
                  child: Image.network(
                    'http://openweathermap.org/img/wn/${state.weather.icon}@2x.png',
                  ),
                ),
                //Получаем описание и с помощью метода capitalize() делаем первую букву заглавной
                Text(
                  state.weather.description.capitalize(),
                  style: const TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Создадим карточки с данными о погоде
                    ReusableCard(
                      title: 'Температура',
                      data: state.weather.temp + ' °C',
                    ),
                    ReusableCard(
                        title: 'Влажность',
                        data: state.weather.humidity + ' %'),
                    ReusableCard(
                        title: 'Ветер', data: state.weather.speed + ' м/с'),
                  ],
                ),
              ],
            );
          } else {
            return const Center(child: Text('Ошибка получения данных'));
          }
        }),
      ),
    );
  }
}
