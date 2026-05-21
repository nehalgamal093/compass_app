import 'package:flutter/services.dart';

const EventChannel eventChannel = EventChannel("com.compass_app.event");

Stream<SensorEvent> get eventData {
  return eventChannel.receiveBroadcastStream().map((event) {
    if (event is double) {
      return SensorEvent(x: 0.0, y: 0.0, z: event);
    } else if (event is List) {
      return SensorEvent(
        x: event[0] as double,
        y: event[1] as double,
        z: event[2] as double,
      );
    }
    return SensorEvent(x: 0.0, y: 0.0, z: 0.0);
  });
}

class SensorEvent {
  final double x;
  final double y;
  final double z;

  SensorEvent({required this.x, required this.y, required this.z});
}
