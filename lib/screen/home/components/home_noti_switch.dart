import 'package:flutter/material.dart';

class HomeNotiSwitch extends StatefulWidget {
  const HomeNotiSwitch({Key? key}) : super(key: key);

  @override
  State<HomeNotiSwitch> createState() => _HomeNotiSwitchState();
}

class _HomeNotiSwitchState extends State<HomeNotiSwitch> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: size.width - 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "상시 모집 알림",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 2),
            Switch(
                value: value,
                onChanged: (value) {
                  value = !value;
                })
          ],
        ),
      ),
    );
  }
}
