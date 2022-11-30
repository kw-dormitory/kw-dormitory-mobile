import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/notice.dart';
import 'package:kw_dormitory/model/post.dart';
import 'package:kw_dormitory/screen/notice/notice_view_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeItem extends StatelessWidget {
  const NoticeItem({Key? key, required this.notice}) : super(key: key);

  final Notice notice;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  launchUrl(Uri.parse("https://kw.happydorm.or.kr/"));
                },
                child: Container(
                  width: size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notice.createdAt,
                            style: TextStyle(fontSize: 10, color: kGreyColor)),
                        SizedBox(height: 8),
                        Text(notice.title),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 4,
              color: kBackgroundColor,
            )
          ],
        ));
  }
}
