import 'package:flutter/material.dart';
import 'package:testweather/presentation/widgets/weather_list.dart';

class DailyWeather extends StatelessWidget {
  const DailyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WeatherList(),
    );
  }
}
//       Column(
//         children: [
//           WeatherCard(
//             wind: '5 м/с',
//             id: 'cloud',
//             humidity: '81%',
//             temp: '5° C',
//             data: '24 января',
//             day: 'Понедельник',
//           ),
//           WeatherCard(
//             wind: '5 м/с',
//             id: 'cloud',
//             humidity: '81%',
//             temp: '5° C',
//             data: '24 января',
//             day: 'Понедельник',
//           ),
//           WeatherCard(
//             wind: '5 м/с',
//             id: 'cloud',
//             humidity: '81%',
//             temp: '5° C',
//             data: '24 января',
//             day: 'Понедельник',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class WeatherCard extends StatelessWidget {
//   const WeatherCard({
//     required this.temp,
//     required this.wind,
//     required this.humidity,
//     required this.id,
//     required this.day,
//     required this.data,
//     Key? key,
//   }) : super(key: key);
//
//   final String temp;
//   final String wind;
//   final String humidity;
//   final String id;
//   final String day;
//   final String data;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 20,
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//       child: ListTile(
//         tileColor: const Color(0xff22417a),
//         leading: Column(
//           children: [
//             Text(
//               temp,
//               style: const TextStyle(fontSize: 15),
//             ),
//             Text(
//               wind,
//               style: const TextStyle(fontSize: 15),
//             ),
//             Text(
//               humidity,
//               style: const TextStyle(fontSize: 15),
//             )
//           ],
//         ),
//         title: Text(
//           day,
//           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(
//           data,
//           style: const TextStyle(
//             fontSize: 17,
//           ),
//         ),
//         trailing: Icon(Icons.cloud),
//       ),
//     );
//   }
// }
