import 'package:amiraapp/modules/chat_content.dart';
import 'package:amiraapp/modules/messenger_screesn.dart';
import 'package:amiraapp/presentation/web_view/webview.dart';

import 'data_layer/diohelper.dart';
import 'presentation/news_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DioHelper.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: News_layout(),
      initialRoute: News_layout.MaterialNamed,
      routes: {},
    );
  }
}
