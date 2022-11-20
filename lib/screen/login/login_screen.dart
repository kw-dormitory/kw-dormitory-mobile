import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kw_dormitory/screen/home/home_screen.dart';
import 'package:kw_dormitory/util/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, required this.fcmToken}) : super(key: key);

  final fcmToken;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: size.width,
        height: size.height,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            top: 64,
            left: 24,
            child: Text(
              "광운대학교\n기숙사\n도우미",
              style: TextStyle(
                  fontFamily: "GmarketSans",
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'asset/images/building.png',
                height: size.height / 2.7,
              )),
          Positioned(
              bottom: -30,
              right: -65,
              child: Hero(
                tag: 'studentHero',
                child: Image.asset(
                  'asset/images/student.png',
                  width: size.width * 0.95,
                ),
              )),
          Positioned(
              bottom: 16,
              child: SizedBox(
                width: size.width - 32,
                child: TextButton(
                    onPressed: () {
                      kakaoLogin(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'asset/images/kakao.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                              color: Colors.black.withOpacity(0.9),
                            ),
                            Text(
                              '카카오로 시작하기 ',
                              style: TextStyle(
                                  color: Color(0xFF191919),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 24)
                          ]),
                    ),
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(0.1)),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.fromLTRB(20, 8, 20, 8)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFFFE500)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))))),
              ))
        ]),
      )),
    );
  }

  Future<void> kakaoLogin(BuildContext context) async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        serviceLogin(context);
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        serviceLogin(context);
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }

  Future<void> serviceLogin(BuildContext context) async {
    final user = await UserApi.instance.me();

    var dio = await getDio(null);
    final response = await dio.post("/auth/login",
        data: {"token": "$fcmToken", "userId": "${user.id}"});

    final accessToken = response.data;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("jwt-token", accessToken);

    navigateToHome(context, accessToken);
  }

  void navigateToHome(BuildContext context, String token) {
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => HomeScreen(token: token))));
  }
}
