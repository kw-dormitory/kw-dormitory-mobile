import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/notice.dart';
import 'package:kw_dormitory/model/post.dart';
import 'package:kw_dormitory/screen/notice/components/notice_item.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key, required this.notices}) : super(key: key);
  final List<Notice> notices;

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  bool enableAllNoti = true;
  bool enableRecruitNoti = true;
  bool enable24hNoti = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onChanged: (string) {},
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
              child: Column(
                children: List.generate(
                  widget.notices.length,
                  (index) => NoticeItem(notice: widget.notices[index]),
                ),
              ),
            ))
          ],
        ));
  }
}
