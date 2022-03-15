//Возвращаем название дня недели в зависимости от номера дня
import 'package:flutter/material.dart';

class DayOfWeek extends StatelessWidget {
  const DayOfWeek({required this.weekday});
  final int weekday;

  @override
  Widget build(BuildContext context) {
    return Text((() {
      if (weekday == 1) {
        return "Понедельник";
      }
      if (weekday == 2) {
        return "Вторник";
      }
      if (weekday == 3) {
        return "Среда";
      }
      if (weekday == 4) {
        return "Четверг";
      }
      if (weekday == 5) {
        return "Пятница";
      }
      if (weekday == 6) {
        return "Суббота";
      } else {
        return "Воскресенье";
      }
    })());
  }
}
