import 'package:charts_with_slider/charts_widget.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/schedule_v1.dart';
import 'package:charts_with_slider/core/constants/types_custom.dart';
import 'package:charts_with_slider/dependencies/export.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<POINT> line = [
    (x: 0, y: 0),
    (x: 1, y: 10),
    (x: 2, y: 9),
    (x: 3, y: 10),
    (x: 4, y: 10),
    (x: 5, y: 12),
    (x: 6, y: 11),
    (x: 6.5, y: 12),
    (x: 6.9, y: 13),
    (x: 7, y: 14),
    (x: 7.15, y: 16),
    (x: 7.3, y: 18),
    (x: 7.75, y: 18),
    (x: 8.1, y: 20),
    (x: 8.5, y: 23),
    (x: 8.9, y: 24),
    (x: 9.5, y: 28),
    (x: 11, y: 32),
    (x: 12, y: 33),
    (x: 13, y: 33.5),
    (x: 14, y: 34),
    (x: 15, y: 35),
    (x: 15.5, y: 36),
    (x: 16, y: 35),
    (x: 17, y: 30),
    (x: 18, y: 31),
    (x: 19, y: 25),
    (x: 20, y: 23),
    (x: 21, y: 17),
    (x: 22, y: 14),
    (x: 23, y: 12),
    (x: 24, y: 11),
  ];

  List<POINT> line2 = [
    (x: 0, y: 20),
    (x: 9.5, y: 22),
    (x: 12, y: 24),
    (x: 13, y: 23),
    (x: 14, y: 34),
    (x: 15, y: 35),
    (x: 15.5, y: 36),
    (x: 16, y: 35),
    (x: 17, y: 30),
    (x: 18, y: 31),
    (x: 19, y: 25),
    (x: 20, y: 23),
    (x: 21, y: 17),
    (x: 22, y: 14),
    (x: 23, y: 12),
    (x: 24, y: 11),
  ];
  List<POINT> line3 = [
    (x: 0, y: 16),
    (x: 6.5, y: 18),
    (x: 9.5, y: 20),
    (x: 11, y: 22),
    (x: 12, y: 24),
    (x: 13, y: 23),
    (x: 14, y: 22),
    (x: 15, y: 22),
    (x: 15.5, y: 24.5),
    (x: 16, y: 26),
    (x: 17, y: 24),
    (x: 18, y: 22),
    (x: 19, y: 20),
    (x: 20, y: 18),
    (x: 21, y: 17),
    (x: 22, y: 16),
    (x: 23, y: 17),
    (x: 24, y: 18),
  ];
  List<POINT> line4 = [
    (x: 0, y: 10),
    (x: 1, y: 15),
    (x: 2, y: 14),
    (x: 3, y: 8),
    (x: 4, y: 6),
    (x: 5, y: 12),
    (x: 6, y: 18),
    (x: 6.5, y: 19),
    (x: 6.9, y: 22),
    (x: 7, y: 24),
    (x: 7.15, y: 24),
    (x: 7.3, y: 24),
    (x: 7.75, y: 24),
    (x: 8.1, y: 26),
    (x: 8.5, y: 26),
    (x: 8.9, y: 28),
    (x: 9.5, y: 28),
    (x: 11, y: 32),
    (x: 12, y: 33),
    (x: 13, y: 33),
    (x: 14, y: 30),
    (x: 15, y: 30),
    (x: 15.5, y: 28),
    (x: 16, y: 27),
    (x: 17, y: 25),
    (x: 18, y: 26),
    (x: 19, y: 25),
    (x: 20, y: 23),
    (x: 21, y: 20),
    (x: 22, y: 22),
    (x: 23, y: 21),
    (x: 24, y: 19),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: ChartsWidget.ChartV1WithAxis(
        colorXYLine: Colors.green,
        listLines: [
          ScheduleV1(
            values: line,
            colorGraph: Colors.indigo,
          ),
          ScheduleV1(
            values: line2,
            colorGraph: Colors.red,
          ),
          ScheduleV1(
            values: line3,
            colorGraph: Colors.green,
          ),
          ScheduleV1(
            values: line4,
            colorGraph: Colors.blueAccent,
          ),
        ],
        width: 500,
        height: 500,
      ),
    );
  }
}
