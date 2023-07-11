import 'package:flutter/material.dart';

import '../data/course.dart';

/// Helper function to compute the color of the time indicator based on the amount of work done
Color hoursProgressionColor(Course course) {
  double quarter = course.minutesPerWeek / 4;
  if (course.currentMinutes < quarter) {
    return Colors.red;
  } else if (quarter <= course.currentMinutes &&
      course.currentMinutes < 2 * quarter) {
    return Colors.orange;
  } else if (2 * quarter <= course.currentMinutes &&
      course.currentMinutes < 3 * quarter) {
    return Colors.yellow;
  } else {
    return Colors.green;
  }
}
