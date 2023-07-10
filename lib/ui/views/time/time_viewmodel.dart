import 'package:namer_app/data/course.dart';
import 'package:namer_app/services/courses_service.dart';
import 'package:namer_app/services/mock_courses_service.dart';
import 'package:stacked/stacked.dart';

class TimeViewModel extends BaseViewModel {
  //TODO: Change below when a real implementation of coursesdata exists
  CoursesData coursesData = MockCoursesData();

  List<Course> _courses = List.empty();
  List<Course> get courses => _courses;

  /// init
  TimeViewModel() { 
    getCourses();
  }

  /// Update the list of courses in the UI
  void getCourses() {
    coursesData.getCourses().then((courses) => {
      _courses = courses,
      notifyListeners()     
      }
    );
  }

  /// Callback function when the user adds time to a course
  void updateCourseMinutes(Course course, int hours, int minutes) { 
    int totalMinutes = 60*hours + minutes;
    coursesData
      .updateCourseMinutes(course, totalMinutes)
      .onError((error, stackTrace) => print(error.toString()))
      .then((value) => getCourses());
  }
}