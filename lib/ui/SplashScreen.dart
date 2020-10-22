import 'dart:async';

import 'package:flutter/material.dart';
import 'package:impero_it_services/ui/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

/*
  startSplash() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, () {
      setState(() {
        startTime();
      });
    });
  }
*/

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
//    SizeConfig.init(context);
    return Scaffold(
      body: new Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Impero IT Services"),
        ),
      ),
    );
  }
}