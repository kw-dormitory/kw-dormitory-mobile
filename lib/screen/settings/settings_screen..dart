import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool enableAllNoti = true;
  bool enableRecruitNoti = true;
  bool enable24hNoti = true;
  bool enableTimeNoti = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "설정",
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
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: size.width / 4,
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/72238126?v=4'),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "기숙사생 1",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            color: Colors.white,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("알림",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("공지사항 전체 알림"),
                        ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("기숙사 상시모집 알림"),
                        ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("24시간 알림 설정"),
                        ),
                        Switch(
                            value: enable24hNoti,
                            onChanged: (value) {
                              setState(() {
                                enable24hNoti = value;
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("통금시간 알림"),
                        ),
                        Switch(
                            value: enableTimeNoti,
                            onChanged: (value) {
                              setState(() {
                                enableTimeNoti = value;
                              });
                            }),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 12,
                    ),
                    Text("앱 정보",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("개인정보처리방침"),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chevron_right,
                              color: kGreyColor,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("버전 1.0.0"),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.chevron_right,
                              color: kGreyColor,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
