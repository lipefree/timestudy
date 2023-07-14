import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/routing/locations/stats_location.dart';
import 'package:namer_app/routing/locations/time_location.dart';
import 'package:namer_app/ui/rail_naviguation.dart';
import 'package:namer_app/ui/screens/time/time_screen.dart';
import 'package:namer_app/ui/widgets/bottom_naviguation.dart';
import '../generator/generator_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _beamerKey = GlobalKey<BeamerState>();
  final _routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        TimeLocation(),
        StatsLocation(),
      ],
    ),
  );

  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(children: [
              Expanded(
                  child: ColoredBox(
                color: colorScheme.onInverseSurface,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: Beamer(
                    routerDelegate: _routerDelegate,
                    key: _beamerKey,
                  ),
                ),
              )),
              BottomNavigationBarWidget(beamerKey: _beamerKey)
            ]);
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRailWidget(
                      beamerKey: _beamerKey, constraints: constraints),
                ),
                Expanded(
                    child: ColoredBox(
                  color: colorScheme.surfaceVariant,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    child: Beamer(
                      routerDelegate: _routerDelegate,
                      key: _beamerKey,
                    ),
                  ),
                )),
              ],
            );
          }
        },
      ),
    );
  }
}
