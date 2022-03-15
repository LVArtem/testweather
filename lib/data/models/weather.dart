//Подслой уровня данных - model, в котором создаем класс Weather и пречисляем все погодные данные, которые хотим отобразить на экране приложения

class Weather {
  Weather({
    required this.name,
    required this.humidity,
    required this.icon,
    required this.speed,
    required this.temp,
    required this.longitude,
    required this.latitude,
    required this.description,
  });
//Конструктор класса
  final String name;
  final String humidity;
  final String icon;
  final String temp;
  final String speed;
  final double longitude;
  final double latitude;
  final String description;

//С помощью factory конструктора передаем поля из JSON в переменные.

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        name: json['name'],
        humidity: json['main']['humidity'].toString(),
        icon: json['weather'][0]['icon'],
        temp: json['main']['temp'].toInt().toString(),
        speed: json['wind']['speed'].toInt().toString(),
        latitude: json['coord']['lat'],
        longitude: json['coord']['lon'],
        description: json['weather'][0]['description']);
  }
}
