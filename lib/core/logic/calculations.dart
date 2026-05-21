import 'dart:math' as maths;

class Calculations {
  static double calculateBearing(double x, double y) {
    double angle = maths.atan2(y, x);
    double bearing = angle * 180 / maths.pi;
    bearing = normalizeDegree(bearing);
    return bearing;
  }

 static double normalizeDegree(double degree) {
    degree = degree % 360;
    if (degree < 0) {
      degree += 360;
    }
    return degree;
  }
}