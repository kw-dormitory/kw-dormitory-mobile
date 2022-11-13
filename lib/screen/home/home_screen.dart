import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/screen/home/components/date_counter.dart';
import 'package:kw_dormitory/screen/home/components/penalty_counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              top: 5,
              child: Hero(
                tag: 'studentHero',
                child: Image.asset(
                  'asset/images/student.png',
                  width: size.width / 2.2,
                ),
              ),
            ),
            Positioned(
              top: size.height / 4.7,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [PenaltyCounter()],
                ),
              ),
            ),
            Positioned(
                left: size.width / 10,
                top: size.width / 8,
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
