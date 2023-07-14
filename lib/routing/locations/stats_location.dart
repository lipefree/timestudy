import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/ui/screens/stats/stats_screen.dart';

class StatsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/stats'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('stats'),
          title: 'Statistics',
          type: BeamPageType.noTransition,
          child: StatsScreen(),
        ),
      ];
}
