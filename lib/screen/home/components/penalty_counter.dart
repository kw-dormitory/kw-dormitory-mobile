import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PenaltyCounter extends StatelessWidget {
  PenaltyCounter({Key? key, required this.score}) : super(key: key);

  late int score;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: Colors.white,
      child: Ink(
        width: size.width - 32,
        height: 130,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "벌점계산기",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios_sharp, color: kGreyColor)
                  ],
                ),
                LinearPercentIndicator(
                  percent: score / 20,
                  progressColor: kAccentColor,
                  backgroundColor: kBackgroundColor,
                  lineHeight: 15,
                  animation: true,
                  barRadius: Radius.circular(12),
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("현재 벌점은 "),
                    Text("$score",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(" 점 입니다.")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
