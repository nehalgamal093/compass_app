import 'dart:async';
import 'dart:math' as maths;
import 'package:compass_app/listener.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription? _streamSubscription;
  List<double> sensorValues = [];
  @override
  void initState() {
    sensorValues = <double>[];

    _streamSubscription = eventData.listen((event){
      setState(() {
        sensorValues = <double>[event.x,event.y,event.z];
        print(sensorValues);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double angle = maths.atan2(sensorValues[1], sensorValues[0]);
    return Scaffold(
      body: Center(
        child: Transform.rotate(
           angle: maths.pi/2 - angle,
            child: Image.asset("assets/compass.png",width: 500,)),
      ),
    );
  }
}
