import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/penalty.dart';
import 'package:kw_dormitory/screen/penalty/components/penalty_item.dart';
import 'package:kw_dormitory/util/dio.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PenaltyScreen extends StatefulWidget {
  const PenaltyScreen({Key? key, required this.token, required this.penalty})
      : super(key: key);

  final String token;
  final PenaltyResponse penalty;
  @override
  State<PenaltyScreen> createState() => _PenaltyScreenState();
}

class _PenaltyScreenState extends State<PenaltyScreen> {
  bool enablePenaltyNoti = true;
  int newScore = 1;
  String newDetail = "";

  Future _commitPenalty(BuildContext context) async {
    final initialDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate == null) return;

    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                  title: Center(
                    child: Text('사유 작성',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center),
                  ),
                  content: IntrinsicHeight(
                      child: Column(children: [
                    Divider(height: 2),
                    SizedBox(
                      height: 150,
                      child: TextField(
                        onChanged: (value) {
                          newDetail = value;
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "벌점 사유를 입력하세요",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        maxLines: null,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (newScore > 1) {
                                setState(() {
                                  newScore -= 1;
                                });
                              }
                            },
                            icon: Icon(Icons.remove)),
                        Text("$newScore"),
                        IconButton(
                            onPressed: () {
                              if (newScore < 20) {
                                setState(() {
                                  newScore += 1;
                                });
                              }
                            },
                            icon: Icon(Icons.add))
                      ],
                    )
                  ])),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          var dio = getDio(widget.token);
                          final response = await dio.post("/penalty", data: {
                            "content": newDetail,
                            "date": DateFormat('yyyy-MM-dd')
                                .format(DateTime.now())
                                .toString(),
                            "penalty": newScore
                          });
                          widget.penalty.penalties.add(Penalty(
                              content: newDetail,
                              date: DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now())
                                  .toString(),
                              id: -1,
                              penalty: newScore));
                          widget.penalty.totalPenalty += newScore;
                          print(response.data);
                          newScore = 1;
                          newDetail = "";
                          Navigator.pop(context);
                        },
                        child: Text("완료",
                            style: TextStyle(
                              color: Colors.white,
                            )))
                  ],
                  actionsAlignment: MainAxisAlignment.center,
                  contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ));
  }

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
                            percent: widget.penalty.totalPenalty / 20,
                            center: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${widget.penalty.totalPenalty}",
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
                  children: List.generate(
                      widget.penalty.penalties.length,
                      (index) => PenaltyItem(
                          penalty: widget.penalty.penalties[index]))),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _commitPenalty(context);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
