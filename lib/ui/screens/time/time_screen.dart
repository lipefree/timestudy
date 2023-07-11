import 'package:flutter/material.dart';
import 'package:namer_app/ui/screens/time/course_timepicker.dart';
import 'package:namer_app/ui/screens/time/course_card.dart';
import 'package:provider/provider.dart';

import '../../../data/course.dart';
import 'time_viewmodel.dart';

class TimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TimeViewModel(), child: TimeView());
  }
}

class TimeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var timeScreenState = context.watch<TimeViewModel>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display a card for each course
          for (var course in timeScreenState.courses)
            Padding(
                padding: EdgeInsets.all(8),
                child: CourseCard(
                  course: course,
                  onPressedAddHours: (Course course) async {
                    final TimeOfDay? time = await getTimePicker(context);

                    if (time != null) {
                      timeScreenState.updateCourseMinutes(
                          course, time.hour, time.minute);
                    }
                  },
                ))
        ],
      ),
    );
  }
}
