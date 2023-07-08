import 'package:flutter/material.dart';
import 'package:namer_app/ui/components/coursecard.dart';
import 'package:stacked/stacked.dart';

import 'time_viewmodel.dart';

class TimeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TimeViewModel(), 
      builder: (context, model, child) => 
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                // Make better use of wide windows with a grid.
                child: GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio:5/2,
                  ),
                  children: [
                    Text('Length is ${model.courses.length}'),
                    for(var course in model.courses)
                      CourseCard(course: course)   
                  ],
                )
              )]
      ),
    );
  } 
}