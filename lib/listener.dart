import 'package:flutter/services.dart';

const EventChannel CHANNEL = EventChannel("com.compass_app.event");

class EventChannelData{
  final double x;
  final double y;
  final double z;
  EventChannelData(this.x,this.y,this.z);

  double getZ() => this.z;

  @override
  String toString() => "[EventChannelData (x: $x, y: $y, z: $z)]";

}

EventChannelData _listOfValues(List<double> data){
  return EventChannelData(data[0], data[1], data[2]);
}
Stream<EventChannelData>? _magneticEvent;
Stream <EventChannelData> get eventData{
  _magneticEvent ??= CHANNEL.receiveBroadcastStream().map((event)=> _listOfValues(event.cast<double>()));
  return _magneticEvent!;
}