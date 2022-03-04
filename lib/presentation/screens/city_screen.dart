import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:testweather/busines_logic/weather_cubit.dart';

class CityScreen extends StatelessWidget {
  String cityName = '';
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  onChanged: (value) {
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
            const SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 10.0,
                  color: const Color(0x20D6D6D6),
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 42.0,
                    onPressed: () {
                      clearText();
                      Navigator.pushNamed(context, '/second');
                      context.read<WeatherCubit>().getWeather(cityName);
                    },
                    child: const Text(
                      'Показать',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
