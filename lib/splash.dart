import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cab/utils/CustomTextStyle.dart';

import 'login.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    super.initState();
    splashMove();
  }
  navigatePage() {
    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) => Login()));
  }

  splashMove() {
    return Timer(Duration(seconds: 4), navigatePage);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Builder(builder: (context){
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("images/ic_logo.png"),)
                  ),
                ),
                Text("Safety and comforts is our concerns",style: CustomTextStyle.regularTextStyle,)
              ],
            ),
          );
        }),
      ),
    );
  }
}
