import 'package:flutter/material.dart';
import 'package:namer_app/ui/screens/time/course_timepicker.dart';
import 'package:namer_app/ui/screens/time/course_card.dart';
import 'package:stacked/stacked.dart';

import '../../../data/course.dart';
import 'time_viewmodel.dart';

class TimeView extends StatelessWidget {
  final TimeViewModel timeViewModel = TimeViewModel();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TimeViewModel(),
      builder: (context, model, child) => Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var course in model.courses)
            Padding(
                padding: EdgeInsets.all(8),
                child: CourseCard(
                  course: course,
                  onPressedAddHours: (Course course) async {
                    final TimeOfDay? time = await getTimePicker(context);

                    if (time != null) {
                      model.updateCourseMinutes(course, time.hour, time.minute);
                    }
                  },
                ))
        ],
      )),
    );
  }
}
