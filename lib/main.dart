import 'package:flutter/material.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/screen/splash/splash_screen.dart';
import 'package:kw_dormitory/util/create_material_color.dart';

void main() {
  runApp(const KwDormitoryApp());
}

class KwDormitoryApp extends StatelessWidget {
  const KwDormitoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: createMaterialColor(kThemeColor),
          fontFamily: "NanumSquare"),
      home: const SplashScreen(),
    );
  }
}
