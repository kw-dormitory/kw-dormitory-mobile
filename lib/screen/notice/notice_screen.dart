import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/notice.dart';
import 'package:kw_dormitory/model/post.dart';
import 'package:kw_dormitory/screen/notice/components/notice_item.dart';
import 'package:kw_dormitory/util/dio.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  bool enableAllNoti = true;
  bool enableRecruitNoti = true;
  bool enable24hNoti = true;

  late Future<List<Notice>> notices;

  String filterWord = "";

  @override
  void initState() {
    super.initState();
    notices = fetchNotices();
  }

  Future<List<Notice>> fetchNotices() async {
    var dio = await getDio(widget.token);
    final response = await dio.get("/notice/all");
    return NoticeResponse.fromJson(response.data).notices;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "공지사항",
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
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => StatefulBuilder(
                            builder: (context, setState) => AlertDialog(
                                title: Center(
                                  child: Text('알림',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                content: IntrinsicHeight(
                                  child: Column(
                                    children: [
                                      Divider(height: 2),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 0, 0, 12),
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("공지사항 전체 알림"),
                                              Switch(
                                                  value: enableAllNoti,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      enableAllNoti = value;
                                                    });
                                                  })
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("기숙사 상시모집 알림"),
                                              Switch(
                                                  value: enableRecruitNoti,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      enableRecruitNoti = value;
                                                    });
                                                  })
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("24시간 알림 설정"),
                                              Switch(
                                                  value: enable24hNoti,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      enable24hNoti = value;
                                                    });
                                                  })
                                            ],
                                          )
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ));
                },
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      cursorColor: kAccentColor,
                      keyboardType: TextInputType.text,
                      onSubmitted: (value) {
                        setState(() {
                          filterWord = value;
                        });
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        fillColor: kGreyColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kBackgroundColor, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kBackgroundColor, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        hintText: '글 제목 검색',
                      ),
                      maxLines: 1,
                    ),
                  ),
                )),
            Expanded(
                child: SingleChildScrollView(
                    child: FutureBuilder<List<Notice>>(
                        future: notices,
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                                children: List.generate(
                                    snapshot.data!
                                        .where((element) =>
                                            element.title.contains(filterWord))
                                        .length,
                                    (index) => NoticeItem(
                                        notice: snapshot.data!
                                            .where((e) =>
                                                e.title.contains(filterWord))
                                            .elementAt(index))));
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text("데이터를 불러올 수 없습니다"),
                            );
                          }
                          return SizedBox(
                              height: size.height - 240,
                              child:
                                  Center(child: CircularProgressIndicator()));
                        }))))
          ],
        ));
  }
}
