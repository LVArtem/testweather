import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testweather/busines_logic/weather_cubit.dart';
import 'package:testweather/busines_logic/weather_state.dart';
import 'name_of_weekday.dart';
import 'package:intl/intl.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //С помощью BlocBuilder перестраиваем интерфейс, когда генерируется новое состояние
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      //Если сгенерировано состояние LoadingState, возвращаем индикатор загрузки
      if (state is LoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      //Если сгенерировано состояние LoadedState возвращаем данные полученные данные о погоде
      if (state is LoadedDailyState) {
        return FutureBuilder(builder:
            (BuildContext context, AsyncSnapshot<dynamic> loadedWeather) {
          state.loadedWeather.sort((a, b) => a.temp.compareTo(
              b.temp)); //Сортируем список по температуре от меньшего к большему
          return ListView.builder(
            //Задаем кол-во отображаемых элементов
            itemCount: 3,
            itemBuilder: (context, index) => Card(
              elevation: 20,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              //ListView заполняется виджетами ListTile
              child: ListTile(
                tileColor: Colors.blue[300],
                leading: Column(
                  children: [
                    Text(
                      state.loadedWeather[index].temp.toString() + ' °C',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      state.loadedWeather[index].humidity + ' %',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      state.loadedWeather[index].speed + 'м/с',
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
                //Получаем название дня недели
                title: DayOfWeek(
                    weekday: (DateTime.fromMillisecondsSinceEpoch(
                            state.loadedWeather[index].data * 1000)
                        .weekday)),
                //Получаем дату
                subtitle: Text(
                  DateFormat('dd/MM').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          state.loadedWeather[index].data * 1000)),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                //Получаем погодую иконку
                trailing: Image.network(
                  'http://openweathermap.org/img/wn/${state.loadedWeather[index].icon}@2x.png',
                ),
              ),
            ),
          );
        });
      } else {
        return const Center(child: Text('Ошибка получения данных'));
      }
    });
  }
}
