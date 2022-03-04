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
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is EmptyState) {
        return const Center(
          child: Text(
            'No data received',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }

      if (state is LoadingState) {
        return Center(child: CircularProgressIndicator());
      }

      if (state is LoadedDailyState) {
        print(state.loadedWeather[1].temp + ' °C');
        print(state.loadedWeather[2].temp + ' °C');
        print(state.loadedWeather[3].temp + ' °C');
        return ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => Card(
            elevation: 20,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
              tileColor: const Color(0xff22417a),
              leading: Column(
                children: [
                  Text(
                    state.loadedWeather[index + 1].temp + ' °C',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    state.loadedWeather[index + 1].humidity + ' %',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    state.loadedWeather[index + 1].speed + 'м/с',
                    style: const TextStyle(fontSize: 15),
                  )
                ],
              ),
              title: DayOfWeek(
                  weekday: (DateTime.fromMillisecondsSinceEpoch(
                          state.loadedWeather[index + 1].data * 1000)
                      .weekday)),
              subtitle: Text(
                DateFormat('dd/MM').format(DateTime.fromMillisecondsSinceEpoch(
                    state.loadedWeather[index + 1].data * 1000)),
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
              trailing: Image.network(
                'http://openweathermap.org/img/wn/${state.loadedWeather[index + 1].icon}@2x.png',
              ),
            ),
          ),
        );
      } else {
        return const Text('No data');
      }
    });
  }
}

// class SortList extends StatelessWidget {
//   const SortList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(
//       builder: (context, state) {
//         if (state is LoadedDailyState) {
//           if (state.loadedWeather[1].temp < state.loadedWeather[2].temp < state.loadedWeather[3].temp)
//         }
//         return Container();
//       },
//     );
//   }
// }
