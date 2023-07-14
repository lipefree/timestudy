import 'package:namer_app/data/course.dart';

/// Represent one [course] entry by the user where the user added an amount of [minutes].
/// This is mainly used to offer a `undo` button in the time screen.
/// This is session based and will not be stored in the database.
class CourseAction {
  final Course course;
  final int minutes;

  CourseAction(this.course, this.minutes);
}
