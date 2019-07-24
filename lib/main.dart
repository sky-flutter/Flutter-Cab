import 'package:flutter/material.dart';
import 'package:flutter_cab/splash.dart';

import 'login.dart';

/*
* Start Date : 16-07-2019
* Author : Aakash Kareliya
* */
void main() => runApp(new MaterialApp(
      home: Splash(),
      routes: <String, WidgetBuilder>{
        "\login": (context) => Login(),
      },
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
