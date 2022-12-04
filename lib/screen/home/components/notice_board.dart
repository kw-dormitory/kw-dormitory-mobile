import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/notice.dart';
import 'package:kw_dormitory/screen/home/components/home_noti_switch.dart';
import 'package:kw_dormitory/screen/notice/notice_screen.dart';
import 'package:kw_dormitory/util/dio.dart';

class NoticeBoard extends StatefulWidget {
  const NoticeBoard({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<NoticeBoard> createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  late Future<List<Notice>> notices;

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

    return FutureBuilder<List<Notice>>(
        future: notices,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
                width: size.width - 32,
                child: Column(children: [
                  //HomeNotiSwitch(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  NoticeScreen(notices: snapshot.data!))));
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "공지사항",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right, color: kGreyColor)
                        ],
                      ),
                    ),
                  ),
                  Column(
                      children: List.generate(
                          4,
                          (index) => NoticeBoardItem(
                              notice: snapshot.data![index],
                              isLastItem: index == 3)))
                ]));
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            return Center(
              child: Text("데이터를 불러올 수 없습니다"),
            );
          }
          return SizedBox(
            width: size.width - 32,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "공지사항",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.chevron_right, color: kGreyColor)
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Column(
                        children: List.generate(
                            4,
                            (index) => NoticeBoardItem(
                                notice: emptyNotice, isLastItem: index == 3))),
                    Positioned(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 92),
                        child: const CircularProgressIndicator(),
                      ),
                    ))
                  ],
                )
              ],
            ),
          );
        });
  }
}

class NoticeBoardItem extends StatelessWidget {
  NoticeBoardItem({Key? key, required this.notice, required this.isLastItem})
      : super(key: key);

  final Notice notice;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width - 32,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1,
              width: size.width - 32,
              color: kBackgroundColor,
            ),
            Container(
              width: size.width - 32,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isLastItem ? 15 : 0),
                      bottomRight: Radius.circular(isLastItem ? 15 : 0))),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notice.createdAt,
                            style: TextStyle(color: kGreyColor, fontSize: 12)),
                        SizedBox(height: 4),
                        Text(notice.title, overflow: TextOverflow.ellipsis)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
