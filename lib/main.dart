import 'package:flutter/material.dart';
import 'package:room_chat/pages/Start_Up_Page.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartUP_Page(),
    );
  }
}
