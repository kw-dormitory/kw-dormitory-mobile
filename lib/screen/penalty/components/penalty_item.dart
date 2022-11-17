import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/model/penalty.dart';

class PenaltyItem extends StatelessWidget {
  PenaltyItem({Key? key, required this.penalty}) : super(key: key);

  Penalty penalty;

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(penalty.date,
                            style: TextStyle(fontSize: 10, color: kGreyColor)),
                        SizedBox(height: 4),
                        Text(penalty.title),
                      ],
                    ),
                    Text(
                      "+ ${penalty.score}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 3,
              color: kBackgroundColor,
            )
          ],
        ));
  }
}
