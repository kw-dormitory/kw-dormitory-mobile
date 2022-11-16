import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/post.dart';
import 'package:kw_dormitory/screen/board/components/board_item.dart';

import 'post_write_screen.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<Post> posts = [
    Post(title: "배달 같이 시킬 사람", date: "2022-11-17"),
    Post(title: "삭자제 공동구매", date: "2022-11-15"),
    Post(title: "배달 같이 시킬 사람", date: "2022-11-17"),
    Post(title: "삭자제 공동구매", date: "2022-11-15"),
    Post(title: "배달 같이 시킬 사람", date: "2022-11-17"),
    Post(title: "삭자제 공동구매", date: "2022-11-15"),
    Post(title: "배달 같이 시킬 사람", date: "2022-11-17"),
    Post(title: "삭자제 공동구매", date: "2022-11-15"),
    Post(title: "배달 같이 시킬 사람", date: "2022-11-17"),
    Post(title: "삭자제 공동구매", date: "2022-11-15"),
    Post(title: "배달 같이 시킬 사람", date: "2022-11-17"),
    Post(title: "삭자제 공동구매", date: "2022-11-15"),
    Post(title: "배달 같이 시킬 사람", date: "2022-11-17"),
    Post(title: "삭자제 공동구매", date: "2022-11-15"),
    Post(title: "배달 같이 시킬 사람", date: "2022-11-17"),
    Post(title: "삭자제 공동구매", date: "2022-11-15"),
    Post(title: "배달 같이 시킬 사람", date: "2022-11-17"),
    Post(title: "삭자제 공동구매", date: "2022-11-15")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "게시판",
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
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16),
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
                      (index) => BoardItem(
                          title: posts[index].title, date: posts[index].date)),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => PostWriteScreen())));
            },
            child: Icon(
              Icons.edit,
              color: Colors.white,
            )));
  }
}
