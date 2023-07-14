import 'package:flutter/material.dart';
import 'package:namer_app/data/action.dart';
import 'package:namer_app/data/course.dart';
import 'package:namer_app/providers/courses_provider.dart';
import 'package:namer_app/providers/mock_courses_provider.dart';
import '../../../utils/stack.dart' as util;

class TimeViewModel extends ChangeNotifier {
//TODO: Change below when a real implementation of coursesdata exists
  CoursesData coursesData = MockCoursesData();

  List<Course> _courses = List.empty();
  List<Course> get courses => _courses;
  final actions = util.Stack<CourseAction>();

  TimeViewModel() {
    getCourses(); //Update UI
  }

  /// Update the list of courses in the UI
  void getCourses() async {
    coursesData
        .getCourses()
        .then((courses) => {_courses = courses, notifyListeners()});
  }

  /// Callback function when the user adds time to a course
  void updateCourseMinutes(Course course, int hours, int minutes) async {
    int totalMinutes = 60 * hours + minutes;
    coursesData.updateCourseMinutes(course, totalMinutes).then((updatedCourse) {
      getCourses();
      actions.push(CourseAction(updatedCourse, totalMinutes));
    });
  }

  /// Cancel the last action, actions are stored in a stack (LIFO)
  /// If there is no last aciton, simply does nothing
  void revertOneAction() {
    if (actions.isEmpty) return; // no last action

    var lastAction = actions.pop();
    coursesData
        .updateCourseMinutes(lastAction.course, -lastAction.minutes)
        .then((value) => getCourses());
  }
}
