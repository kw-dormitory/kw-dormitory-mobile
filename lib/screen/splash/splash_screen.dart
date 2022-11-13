import 'package:flutter/material.dart';
import 'package:kw_dormitory/screen/home/home_screen.dart';

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
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => HomeScreen())));
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
            top: 48,
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
                height: size.height / 2.5,
              )),
          Positioned(
              bottom: -30,
              right: -65,
              child: Hero(
                tag: 'studentHero',
                child: Image.asset(
                  'asset/images/student.png',
                  width: size.width * 0.9,
                ),
              )),
        ]),
      )),
    );
  }
}
