import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/screen/home/components/bottom_navigator.dart';
import 'package:kw_dormitory/screen/home/components/date_counter.dart';
import 'package:kw_dormitory/screen/home/components/home_noti_switch.dart';
import 'package:kw_dormitory/screen/home/components/notice_board.dart';
import 'package:kw_dormitory/screen/home/components/penalty_counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.token}) : super(key: key);

  final String token;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            CustomPaint(painter: DrawCircle(size)),
            Positioned(
              right: size.width / 17,
              top: 36,
              child: Hero(
                tag: 'studentHero',
                child: Image.asset(
                  'asset/images/student.png',
                  width: size.width / 2.2,
                ),
              ),
            ),
            Positioned(
              top: size.height / 4.2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: size.height - (size.height / 4.2 + 64),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PenaltyCounter(
                        token: widget.token,
                      ),
                      NoticeBoard(
                        token: widget.token,
                      ),
                      BottomNavigator(
                        token: widget.token,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                left: size.width / 10,
                top: size.width / 6,
                child: DateCounter())
          ]),
        ),
      ),
    );
  }
}

class DrawCircle extends CustomPainter {
  late Size size;
  DrawCircle(this.size);

  @override
  void paint(Canvas canvas, Size size) {
    size = this.size;
    var paint = Paint();
    paint.color = kThemeColor;

    canvas.drawCircle(
        Offset(size.width / 2, -(size.width / 1.3)), size.height * 0.7, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
