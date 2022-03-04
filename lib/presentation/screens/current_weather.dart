import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testweather/busines_logic/weather_cubit.dart';
import 'package:testweather/busines_logic/weather_state.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                context.read<WeatherCubit>().getAllWeatherDaily();
                Navigator.pushNamed(context, '/third');
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            )
          ],
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is LoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
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
                  child: Image.network(
                    'http://openweathermap.org/img/wn/${state.weather.icon}@2x.png',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
            return Center(child: const Text('No Data'));
          }
        }),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    required this.title,
    required this.data,
    Key? key,
  }) : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0x20D6D6D6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(data, style: const TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}
