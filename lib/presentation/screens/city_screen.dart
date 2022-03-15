//Экран 1 - создаем поле для ввода названия города и кнопку показать.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testweather/busines_logic/weather_cubit.dart';

class CityScreen extends StatelessWidget {
  String cityName = '';
  final fieldText = TextEditingController();

  //Метод очищающий текстовое поле после нажатия кнопки "Показать"
  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    //Оборачиваем в SafeArea для того чтобы экран приложея не вылазил на панель времени и т.д.
    return SafeArea(
      child: Scaffold(
        //Располагаем виджеты TextField и MaterialButton в столбец
        body: Column(
          //Располагаем виджеты посередине вдоль вертикальной оси
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                //Создаем текстовое поле
                child: TextField(
                  onChanged: (value) {
                    //Присваиваем введенное название города переменной cityName
                    cityName = value;
                  },
                  controller: fieldText,
                  cursorColor: Colors.white,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFfD6D6D6), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      hintText: 'Название города'),
                ),
              ),
            ),
            //Делаем отступ по вертикали между текстовым полем и кнопкой
            const SizedBox(
              height: 50,
            ),
            //Создаем кнопку "Показать"
            Material(
              elevation: 10.0,
              color: const Color(0x20D6D6D6),
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                onPressed: () {
                  //Вызывем метод clearText для очистки текстового поля
                  clearText();
                  //Переходим на второй экран
                  Navigator.pushNamed(context, '/second');
                  //Вызываем метод getWeather
                  context.read<WeatherCubit>().getWeather(cityName);
                },
                child: const Text(
                  'Показать',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
