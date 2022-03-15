//Подслой уровня данных - weather_daily, в котором создаем класс WeatherDaily и пречисляем все погодные данные, которые хотим отобразить на экране приложения

class WeatherDaily {
  final int data;
  final int temp;
  final String speed;
  final String humidity;
  final String icon;
//Конструктор класса
  WeatherDaily(
      {required this.data,
      required this.temp,
      required this.speed,
      required this.humidity,
      required this.icon});

//С помощью factory конструктора передаем поля из JSON в переменные

  factory WeatherDaily.fromJson(Map<String, dynamic> json) {
    return WeatherDaily(
        data: json['dt'],
        temp: json['temp']['day'].toInt(),
        speed: json['wind_speed'].toInt().toString(),
        humidity: json['humidity'].toString(),
        icon: json['weather'][0]['icon']);
  }
}
