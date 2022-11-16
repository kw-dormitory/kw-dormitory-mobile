import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';

class BoardItem extends StatelessWidget {
  BoardItem({Key? key, required this.title, required this.date})
      : super(key: key);

  String title;
  String date;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        child: Column(
          children: [
            Container(
              width: size.width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("익명", style: TextStyle(fontSize: 12)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title),
                        Text(
                          date,
                          style: TextStyle(fontSize: 10, color: kGreyColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 4,
              color: kBackgroundColor,
            )
          ],
        ));
  }
}
