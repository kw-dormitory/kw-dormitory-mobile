import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/post.dart';
import 'package:kw_dormitory/screen/board/components/board_item.dart';
import 'package:kw_dormitory/util/dio.dart';

import 'post_write_screen.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late Future<List<Post>> posts;

  String filterWord = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      posts = fetchPosts();
    });
  }

  Future<List<Post>> fetchPosts() async {
    var dio = getDio(widget.token);
    final response = await dio.get("/party");
    return PostResponse.fromJson(response.data).posts.reversed.toList();
  }

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
                child: FutureBuilder<List<Post>>(
                    future: posts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              snapshot.data!
                                  .where((element) =>
                                      element.title.contains(filterWord))
                                  .length,
                              (index) => BoardItem(
                                  post: snapshot.data!
                                      .where((element) =>
                                          element.title.contains(filterWord))
                                      .elementAt(index)),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        print(snapshot.stackTrace);
                        return Center(
                          child: Text("데이터를 불러올 수 없습니다"),
                        );
                      }
                      return const CircularProgressIndicator();
                    }))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => PostWriteScreen(
                            token: widget.token,
                            onPost: () {
                              setState(() {
                                posts = fetchPosts();
                              });
                            },
                          ))));
            },
            child: Icon(
              Icons.edit,
              color: Colors.white,
            )));
  }
}
