import 'dart:async';

import 'package:flutter/material.dart';
import 'wallpaper/categories.dart';

import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/animation.dart';


void main()=>runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aligarh Electronics",
      home: new LogoApp(),
    );
  }
}
class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;
@override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, new MaterialPageRoute(builder:(context)=>new categori())));
    controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  Widget build(BuildContext context) {

    return Container(
        color: Colors.white,
        child: FadeTransition(
            opacity: animation,
            child: Center(
              child: Image.asset('assets/logo.jpeg'),
            )
        )
    );
  }
}

