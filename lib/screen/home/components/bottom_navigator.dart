import 'package:flutter/material.dart';
import 'package:kw_dormitory/screen/board/board_screen.dart';
import 'package:kw_dormitory/screen/map/map_screen.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double buttonSize = (size.width - 80) / 4;
    return SizedBox(
      width: size.width - 32,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => BoardScreen())));
                },
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asset/images/board.png',
                          width: buttonSize / 2.5,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "게시판",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
            ),
          ),
          Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => MapScreen())));
                },
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asset/images/map.png',
                          width: buttonSize / 2.5,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "학교지도",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
            ),
          ),
          Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                onTap: () {},
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asset/images/depart.png',
                          width: buttonSize / 2.5,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "공동시설",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
            ),
          ),
          Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                onTap: () {},
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asset/images/settings.png',
                          width: buttonSize / 2.5,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "설정",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
