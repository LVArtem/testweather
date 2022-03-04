import 'package:flutter/material.dart';

class DayOfWeek extends StatelessWidget {
  const DayOfWeek({required this.weekday});
  final int weekday;

  @override
  Widget build(BuildContext context) {
    return Text((() {
      if (weekday == 1) {
        return "Понедельник";
      } else if (weekday == 2) {
        return "Вторник";
      } else if (weekday == 3) {
        return "Среда";
      } else if (weekday == 4) {
        return "Четверг";
      } else if (weekday == 5) {
        return "Пятница";
      } else if (weekday == 6) {
        return "Суббота";
      } else {
        return "Воскресенье";
      }
    })());
  }
}
