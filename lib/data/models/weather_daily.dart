class WeatherDaily {
  final int data;
  final String temp;
  final String speed;
  final String humidity;
  final String icon;

  WeatherDaily(
      {required this.data,
      required this.temp,
      required this.speed,
      required this.humidity,
      required this.icon});

  factory WeatherDaily.fromJson(Map<String, dynamic> json) {
    return WeatherDaily(
        data: json['dt'],
        temp: json['temp']['day'].toInt().toString(),
        speed: json['wind_speed'].toInt().toString(),
        humidity: json['humidity'].toString(),
        icon: json['weather'][0]['icon']);
  }
}

//0.phone
//timezone

//factory WeatherDaily.fromJson(Map<String, dynamic> json) {
//     return WeatherDaily(
//         data: json['daily']['dt'],
//         temp: json['daily']['temp']['day'].toInt().toString(),
//         speed: json['daily']['wind_speed'].toString(),
//         humidity: json['daily']['humidity'].toString(),
//         icon: json['daily']['weather'][0]['icon']);
//   }
// }
