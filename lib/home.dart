import 'dart:async';
import 'dart:math' as maths;
import 'package:compass_app/core/resources/images_manager.dart';
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
    Size size = MediaQuery.sizeOf(context);
    double angle = maths.atan2(sensorValues[1], sensorValues[0]);
    return Scaffold(
      backgroundColor: Color(0xff07162b),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(ImagesManager.compassCircleImg),
            Transform.rotate(
              angle: maths.pi/2 - angle,
              child: ImageIcon(AssetImage(ImagesManager.needleImg),size: size.width*.8,color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
