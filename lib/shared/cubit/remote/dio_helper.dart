// https://newsapi.org/v2/top-headlines?country=eg
// &category=business&apiKey=6b8e609aafb14dfca9ef4bd6db74c62f
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio dio;

  static void initialDio() {
    dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    @required String url,
    @required Map<String, dynamic> query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
