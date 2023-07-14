import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/routing/locations/stats_location.dart';
import 'package:namer_app/routing/locations/time_location.dart';

class NavigationRailWidget extends StatefulWidget {
  NavigationRailWidget({required this.beamerKey, required this.constraints});

  final GlobalKey<BeamerState> beamerKey;
  final BoxConstraints constraints;

  @override
  State<NavigationRailWidget> createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    // Would be nice if pattern matching worked here
    if (_beamerDelegate.currentBeamLocation is TimeLocation) {
      _currentIndex = 0;
    } else if (_beamerDelegate.currentBeamLocation is StatsLocation) {
      _currentIndex = 1;
    }

    return NavigationRail(
      selectedIndex: _currentIndex,
      extended: widget.constraints.maxWidth >= 600,
      destinations: [
        NavigationRailDestination(label: Text('Time'), icon: Icon(Icons.home)),
        NavigationRailDestination(
            label: Text('Stats'), icon: Icon(Icons.show_chart)),
      ],
      onDestinationSelected: (index) => _beamerDelegate.beamToNamed(
          switch (index) { 0 => '/time', 1 => '/stats', _ => '/home' }),
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
