import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/ui/screens/time/time_screen.dart';

class TimeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/time'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('time'),
          title: 'Time',
          type: BeamPageType.noTransition,
          child: TimeScreen(),
        ),
      ];
}
