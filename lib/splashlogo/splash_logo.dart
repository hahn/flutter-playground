import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:intl/intl.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}


class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
//    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
//      ..addListener(() {
//        setState(() {
//          // the state that has changed here is the animation object’s value
//        });
//      });
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
    parseDate("09-04-2018");
  }

  String parseDate(String date){
    DateFormat format = new DateFormat("d-M-y");
    DateFormat newFormat = new DateFormat("d MMMM y");
    print(date);
    var anu = format.parse(date);
    print(newFormat.format(anu));
//    var una = newFormat.parse(anu.toString());
//    print(una.toString());
    return "aduh";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedLogo(animation: animation,),
            new Text("anu")
          ],
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}