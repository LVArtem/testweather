//Подслой данных - model, в котором создаем класс и пречисляем все данные, которые хотим отобразить на экране приложения

class Weather {
  Weather({
    required this.name,
    required this.humidity,
    required this.icon,
    required this.speed,
    required this.temp,
    required this.longitude,
    required this.latitude,
  });

  final String name;
  final String humidity;
  final String icon;
  final String temp;
  final String speed;
  final double longitude;
  final double latitude;

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
    );
  }
}

// daily[0].weather[0].icon
//daily[2].weather[0].icon
//daily[0].humidity
//daily[0].wind_speed
//daily[0].temp.day
//daily[0].dt
//daily[0].weather[0].icon
//daily[1].weather[0].icon
//coord.lat
//coord.lon
