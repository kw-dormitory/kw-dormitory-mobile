import 'package:flutter/material.dart';
import 'package:kw_dormitory/core/fcm.dart';
import 'package:kw_dormitory/screen/home/home_screen.dart';
import 'package:kw_dormitory/screen/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    var fcmToken = await fcmSetting();

    final prefs = await SharedPreferences.getInstance();
    final jwtToken = prefs.getString('jwt-token');

    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: ((context) => jwtToken == null
                ? LoginScreen(fcmToken: fcmToken)
                : HomeScreen(token: jwtToken))),
        (Route<dynamic> route) => false);
  }

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
        ]),
      )),
    );
  }
}
