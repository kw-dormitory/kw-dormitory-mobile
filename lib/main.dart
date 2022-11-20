import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kw_dormitory/constants.dart';
import 'package:kw_dormitory/screen/splash/splash_screen.dart';
import 'package:kw_dormitory/util/create_material_color.dart';

void main() {
  KakaoSdk.init(nativeAppKey: "945b79f2950fa2c577939f5724e2c830");
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
