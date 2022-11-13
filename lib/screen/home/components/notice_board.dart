import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/screen/home/components/home_noti_switch.dart';

class NoticeBoard extends StatefulWidget {
  const NoticeBoard({Key? key}) : super(key: key);

  @override
  State<NoticeBoard> createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width - 32,
      child: Column(
        children: [
          //HomeNotiSwitch(),
          GestureDetector(
            onTap: () {},
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.chevron_right, color: kGreyColor)
                ],
              ),
            ),
          ),
          NoticeBoardItem(date: "2022-10-10", title: "제목", isLastItem: false),
          NoticeBoardItem(date: "2022-10-10", title: "제목", isLastItem: false),
          NoticeBoardItem(date: "2022-10-10", title: "제목", isLastItem: false),
          NoticeBoardItem(date: "2022-10-10", title: "제목", isLastItem: true)
        ],
      ),
    );
  }
}

class NoticeBoardItem extends StatelessWidget {
  NoticeBoardItem(
      {Key? key,
      required this.date,
      required this.title,
      required this.isLastItem})
      : super(key: key);
  late String date;
  late String title;
  late bool isLastItem;

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
                        Text(date,
                            style: TextStyle(color: kGreyColor, fontSize: 12)),
                        SizedBox(height: 4),
                        Text(title, overflow: TextOverflow.ellipsis)
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
