import 'package:namer_app/data/course.dart';
import 'package:namer_app/services/courses_service.dart';
import 'package:namer_app/services/mock_courses_service.dart';
import 'package:stacked/stacked.dart';

class TimeViewModel extends BaseViewModel {
  //TODO: Change below when a real implementation of coursesdata exists
  CoursesData coursesData = MockCoursesData();

  List<Course> _courses = List.empty();
  List<Course> get courses => _courses;

  TimeViewModel() { 
    getCourses();
  }

  void getCourses() {
    coursesData.getCourses().then((courses) => {
      _courses = courses,
      notifyListeners()     
      }
    );
  }
}