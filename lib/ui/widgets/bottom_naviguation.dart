import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/routing/locations/stats_location.dart';
import 'package:namer_app/routing/locations/time_location.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({required this.beamerKey});

  final GlobalKey<BeamerState> beamerKey;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
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
    var coloScheme = Theme.of(context).colorScheme;
    // Would be nice if pattern matching worked here
    if (_beamerDelegate.currentBeamLocation is TimeLocation) {
      _currentIndex = 0;
    } else if (_beamerDelegate.currentBeamLocation is StatsLocation) {
      _currentIndex = 1;
    }

    return BottomNavigationBar(
      backgroundColor: coloScheme.onInverseSurface,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(label: 'Time', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Stats', icon: Icon(Icons.show_chart)),
      ],
      onTap: (index) => _beamerDelegate.beamToNamed(
          switch (index) { 0 => '/time', 1 => '/stats', _ => '/home' }),
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }
}
