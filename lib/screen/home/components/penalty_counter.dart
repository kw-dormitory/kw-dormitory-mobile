import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/penalty.dart';
import 'package:kw_dormitory/screen/penalty/penalty_screen.dart';
import 'package:kw_dormitory/util/dio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:convert';

class PenaltyCounter extends StatefulWidget {
  const PenaltyCounter({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<PenaltyCounter> createState() => _PenaltyCounterState();
}

class _PenaltyCounterState extends State<PenaltyCounter> {
  late Future<PenaltyResponse> penalty;

  @override
  void initState() {
    super.initState();
    penalty = fetchPenalty();
  }

  Future<PenaltyResponse> fetchPenalty() async {
    var dio = getDio(widget.token);
    final response = await dio.get("/penalty");
    print(response.data);
    try {
      final penalty = PenaltyResponse.fromJson(response.data);
    } catch (e) {
      print(e);
    }

    return PenaltyResponse.fromJson(response.data);
  }

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
        child: FutureBuilder<PenaltyResponse>(
          future: penalty,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => PenaltyScreen(
                                token: widget.token,
                                penalty: snapshot.data!,
                              ))));
                },
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right, color: kGreyColor)
                        ],
                      ),
                      LinearPercentIndicator(
                        percent: snapshot.data!.totalPenalty / 20,
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
                          Text("${snapshot.data!.totalPenalty}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(" 점 입니다.")
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              print(snapshot.stackTrace);
              return Center(
                child: Text("데이터를 불러올 수 없습니다"),
              );
            }
            return Center(
              child: const CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}
