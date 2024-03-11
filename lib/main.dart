import 'package:charts_with_slider/charts_widget.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/foreground_options_v1.dart';
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
    (x: 15.5, y: 33),
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

  List<({String text, double value})>? lineXHorizontal = [
    (value: 1, text: ''),
    (value: 2, text: '02'),
    (value: 3, text: ''),
    (value: 4, text: '04'),
    (value: 5, text: ''),
    (value: 6, text: '06'),
    (value: 7, text: ''),
    (value: 8, text: '08'),
    (value: 9, text: ''),
    (value: 10, text: '10'),
    (value: 11, text: ''),
    (value: 12, text: '12'),
    (value: 13, text: ''),
    (value: 14, text: '14'),
    (value: 15, text: ''),
    (value: 16, text: '16'),
    (value: 17, text: ''),
    (value: 18, text: '18'),
    (value: 19, text: ''),
    (value: 20, text: '20'),
    (value: 21, text: ''),
    (value: 22, text: '22'),
    (value: 23, text: ''),
    (value: 24, text: '00'),
  ];
  List<({String text, double value})>? lineYVertical = [
  (value: 0, text: '0'),
  (value: 2, text: '2'),
  (value: 4, text: '4'),
  (value: 6, text: '6'),
  (value: 8, text: '8'),
  (value: 10, text: '10'),
  (value: 12, text: '12'),
  (value: 14, text: '14'),
  (value: 16, text: '16'),
  (value: 18, text: '18'),
  (value: 20, text: '20'),
  (value: 22, text: '22'),
  (value: 24, text: '24'),
  (value: 26, text: '26'),
  (value: 28, text: '28'),
  (value: 30, text: '30'),
  (value: 32, text: '32'),
  (value: 34, text: '34'),
  (value: 36, text: '36'),
  (value: 38, text: ''),
  (value: 40, text: ''),
  (value: 42, text: ''),
  (value: 44, text: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Column(
            children: [
              Text('data'),
              Container(
                color: Colors.green.withOpacity(.2),
                child: ChartsWidget.ChartV1WithAxis(
                  foregroundOptionsV1: ForegroundOptionsV1(
                    lineXHorizontal: lineXHorizontal,
                    lineYVertical: lineYVertical,
                    //textPositionNearLineVertical: TextPositionNearLineVertical.over,
                   // textPositionNearLineHorizontal: TextPositionNearLineHorizontal.center
                  ),
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
              ),
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
