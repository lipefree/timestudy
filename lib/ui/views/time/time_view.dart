import 'package:flutter/material.dart';
import 'package:namer_app/ui/components/coursecard.dart';
import 'package:stacked/stacked.dart';

import '../../../data/course.dart';
import 'time_viewmodel.dart';

class TimeView extends StatelessWidget {
  const TimeView({
    Key? key,
    required this.timeViewModel
  }) : super(key: key);

  final TimeViewModel timeViewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TimeViewModel(), 
      builder: (context, model, child) => 
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               for(var course in model.courses)
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: 
                      CourseCard(
                        course: course, 
                        onPressed: (Course course) async { 
                          final TimeOfDay? time = await showTimePicker(
                            context: context, 
                            initialTime: TimeOfDay(hour: 0, minute: 0),
                            initialEntryMode: TimePickerEntryMode.inputOnly,
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  materialTapTargetSize: MaterialTapTargetSize.padded,
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: MediaQuery(
                                    data: MediaQuery.of(context).copyWith(
                                      alwaysUse24HourFormat: true,
                                    ),
                                    child: child!,
                                  ),
                                ),
                              );
                            },                            
                          );

                          if(time != null) { 
                            model.updateCourseMinutes(course, time.hour, time.minute);
                          }

                        },
                      )
                    )                   
              ]
      ),
    );
  } 
}