import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/penalty.dart';
import 'package:kw_dormitory/screen/penalty/components/penalty_item.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PenaltyScreen extends StatefulWidget {
  const PenaltyScreen({Key? key}) : super(key: key);

  @override
  State<PenaltyScreen> createState() => _PenaltyScreenState();
}

class _PenaltyScreenState extends State<PenaltyScreen> {
  int score = 15;
  bool enablePenaltyNoti = true;
  List<Penalty> penalties = [
    Penalty(title: "통금시간 미준수", date: "2022-11-17", score: 2),
    Penalty(title: "통금시간 미준수", date: "2022-11-17", score: 2),
    Penalty(title: "통금시간 미준수", date: "2022-11-17", score: 2),
    Penalty(title: "통금시간 미준수", date: "2022-11-17", score: 2),
    Penalty(title: "통금시간 미준수", date: "2022-11-17", score: 2),
    Penalty(title: "통금시간 미준수", date: "2022-11-17", score: 2),
    Penalty(title: "통금시간 미준수", date: "2022-11-17", score: 2),
    Penalty(title: "통금시간 미준수", date: "2022-11-17", score: 2),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "벌점계산기",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Container(
            color: kBackgroundColor,
            width: size.width,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: CircularPercentIndicator(
                            radius: size.width / 4,
                            lineWidth: 24,
                            animation: true,
                            percent: score / 20,
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$score",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w800)),
                                Text("점",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: kAccentColor,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text("통금시간 알리미",
                                  style: TextStyle(fontSize: 16)),
                            ),
                            Switch(
                                value: enablePenaltyNoti,
                                onChanged: (value) {
                                  setState(() {
                                    enablePenaltyNoti = value;
                                  });
                                }),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(penalties.length,
                      (index) => PenaltyItem(penalty: penalties[index]))),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
