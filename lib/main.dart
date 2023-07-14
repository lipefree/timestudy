// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/ui/screens/time/time_screen.dart';
import 'package:provider/provider.dart';

import 'states/appstate.dart';
import 'ui/screens/home/home_view.dart';

void main() {
  runApp(TimeStudyApp());
}

class TimeStudyApp extends StatefulWidget {
  const TimeStudyApp({super.key});

  @override
  State<StatefulWidget> createState() => _TimeStudyState();
}

class _TimeStudyState extends State<TimeStudyApp> {
  final routerDelegate = BeamerDelegate(
    initialPath: '/time',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        // Return either Widgets or BeamPages if more customization is needed
        '*': (context, state, data) => MyHomePage(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF825500)),
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}
