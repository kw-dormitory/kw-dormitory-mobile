import 'package:flutter/material.dart';

class DateCounter extends StatelessWidget {
  const DateCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String season = getSeason(now);
    int week = getWeek(now);

    return Column(children: [
      Text(
        "${now.year}\n$season학기",
        style: TextStyle(
            fontFamily: "GmarketSans",
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "${now.month}.${now.day} $week주차",
        style: TextStyle(
            fontFamily: "GmarketSans", fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      )
    ]);
  }

  String getSeason(DateTime now) {
    switch (now.month) {
      case 3:
      case 4:
      case 5:
        return "봄";
      case 6:
      case 7:
      case 8:
        return "여름";
      case 9:
      case 10:
      case 11:
        return "가을";
      case 12:
      case 1:
      case 2:
        return "겨울";
    }
    return "Unknown";
  }

  int getWeek(DateTime now) {
    if (now.month >= 9) {
      String date = "${now.year}0901";
      return (now.difference(DateTime.parse(date)).inDays / 7 + 1).toInt();
    } else {
      String date = "${now.year}0301";
      return (now.difference(DateTime.parse(date)).inDays / 7 + 1).toInt();
    }
  }
}
