import 'dart:async';

import 'package:compass_app/core/logic/directions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../listener.dart';
import '../../../logic/calculations.dart';

class CompassProvider extends ChangeNotifier {
  StreamSubscription? _streamSubscription;
  List<double> sensorValues = [0.0, 0.0, 0.0];
  double bearing = 0.0;
  String direction = 'N';

  void streamValues() {
    sensorValues = <double>[];
    _streamSubscription = eventData.listen((event) {
      sensorValues = <double>[event.x, event.y, event.z];
      bearing = Calculations.calculateBearing(sensorValues[0], sensorValues[1]);
     direction = Directions.getShortDirection(bearing);
      notifyListeners();
    });
  }
}
