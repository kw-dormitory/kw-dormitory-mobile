import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

Dio getDio(String? token) {
  var dio = Dio();

  dio.options.baseUrl = "http://10.0.2.2:8888/api/v1";

  if (token != null) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  return dio;
}
