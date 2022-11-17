import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/post.dart';
import 'package:kw_dormitory/screen/notice/components/notice_item.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  List<Post> posts = [
    Post(title: "행복기숙사 입사생 대상 금융생활 교육 시행 안내", date: "2022-11-17"),
    Post(title: "공동취사실 앞 쓰레기통 임시 철거 예정 안내", date: "2022-11-15"),
    Post(title: "행복기숙사 생활 규칙 재전파", date: "2022-11-17"),
    Post(title: "행복기숙사 시스템 에어컨 냉방에서 난방 전환", date: "2022-11-15"),
    Post(title: "2022년 2학기 중간고사 기간 행복기숙사 야간 출입 허용 안내", date: "2022-11-17"),
    Post(title: "2022년 10월 냉장고 지퍼백 지급 안내", date: "2022-11-15"),
    Post(title: "행복기숙사 카카오톡 채널 운영 안내", date: "2022-11-17"),
    Post(title: "행복기숙사 벌점 적용 강화 안내", date: "2022-11-15"),
    Post(title: "행복기숙사 입사생 대상 금융생활 교육 시행 안내", date: "2022-11-17"),
    Post(title: "공동취사실 앞 쓰레기통 임시 철거 예정 안내", date: "2022-11-15"),
    Post(title: "행복기숙사 생활 규칙 재전파", date: "2022-11-17"),
    Post(title: "행복기숙사 시스템 에어컨 냉방에서 난방 전환", date: "2022-11-15"),
    Post(title: "2022년 2학기 중간고사 기간 행복기숙사 야간 출입 허용 안내", date: "2022-11-17"),
    Post(title: "2022년 10월 냉장고 지퍼백 지급 안내", date: "2022-11-15"),
    Post(title: "행복기숙사 카카오톡 채널 운영 안내", date: "2022-11-17"),
    Post(title: "행복기숙사 벌점 적용 강화 안내", date: "2022-11-15"),
  ];

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
                onPressed: () {},
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
                  posts.length,
                  (index) => NoticeItem(post: posts[index]),
                ),
              ),
            ))
          ],
        ));
  }
}
