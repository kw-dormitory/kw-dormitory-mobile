import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';

class PostViewScreen extends StatefulWidget {
  const PostViewScreen({Key? key}) : super(key: key);

  @override
  State<PostViewScreen> createState() => _PostViewScreenState();
}

class _PostViewScreenState extends State<PostViewScreen> {
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
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                        'https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("익명"),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "2022-11-17 04:02",
                        style: TextStyle(fontSize: 10, color: kGreyColor),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "배달 같이 시켜먹을 사람?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text("떡볶이나 치킨 중에서 땡기는데 떡볶이 치킨 각각 시켜서 반반 나눌 사람 구합니다.")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(
          'asset/images/kakao.png',
          color: Colors.white,
          width: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
