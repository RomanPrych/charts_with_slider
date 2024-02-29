import 'dart:math';
import 'dart:ui';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/schedule_v1.dart';
import 'package:charts_with_slider/core/constants/types_custom.dart';
import 'package:charts_with_slider/dependencies/export.dart';

class ChartV1WithAxisProvider extends ChangeNotifier {
  ChartV1WithAxisProvider({
    required this.widthMain,
    required this.heightMain,
    required this.listLines,
    this.colorXYLine,
    this.widthXYLine,
    this.verticalLineColor,
    this.verticalLineWidth,
  }) {
    state.widthFieldGiven = widthMain;
    state.heightFieldGiven = heightMain;
  }

  final double widthMain;
  final double heightMain;
  final List<ScheduleV1> listLines;
  final Color? colorXYLine;
  final double? widthXYLine;
  final Color? verticalLineColor;
  final double? verticalLineWidth;
  CharV1WithAxisState state = CharV1WithAxisState();

  void drawXYLine(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color = colorXYLine ?? Colors.black
      ..strokeWidth = widthXYLine ?? 1;

    canvas.drawLine(
        Offset(0, size.height), Offset(size.width, size.height), paint);
    canvas.drawLine(const Offset(0, 0), Offset(0, size.height), paint);
  }

  void drawVerticalLine(
    Canvas canvas,
    Size size,
  ) {
    final linePaint = Paint()
      ..color = verticalLineColor ?? Colors.blue
      ..strokeWidth = verticalLineWidth ?? 2.0;
    final lineStart = Offset(state.sliderValue * size.width, size.height);
    final lineEnd = Offset(state.sliderValue * size.width, 0);
    canvas.drawLine(lineStart, lineEnd, linePaint);
  }

  void changePositionVerticalLine(double value) {
    try {
      RenderBox? ren =
      state.keyOfField.currentContext?.findRenderObject() as RenderBox;
      Offset offsetFirst = ren.localToGlobal(Offset.zero);
      double startPosition = offsetFirst.dx;
      double delta = value - startPosition;
      double calcPositionSliderValue = delta / state.widthFieldGiven;
      state.sliderValue = max(0, min(calcPositionSliderValue, 1));
      notifyListeners();
    } catch (e) {
      print('ERROR CharV1WithAxisProvider =$e ');
    }
  }

  void getMaxXMaxY(List<POINT> values) {
    for (POINT element in values) {
      state.maxX = max(state.maxX, element.x * state.maxPlusCoefficientX);
      state.maxY = max(state.maxY, element.y * state.maxPlusCoefficientY);
    }
  }

  /// ///////////////////
  void drawAllGraphs(
    Canvas canvas,
    Size size,
  ) {
    for (final lineGraph in listLines) {
      drawGraph(
        canvas: canvas,
        size: size,
        model: lineGraph,
      );
      drawPointOnGraph(canvas: canvas, size: size, model: lineGraph);
    }
  }

  void drawPointOnGraph({required Canvas canvas,
    required Size size,required ScheduleV1 model,}
      ){
    final thumbPaint2 = Paint()
      ..color = model.colorGraph
      ..strokeWidth = 2.0;///todo
    getMaxXMaxY(model.values);
    double coefX = size.width / state.maxX;
    double coefY = size.height / state.maxY;
    List<Offset> listOf = model.values
        .map((e) => Offset((e.x * coefX), -((e.y * coefY) - size.height)))
        .toList();

    canvas.drawCircle(
        Offset(state.sliderValue * size.width,
            getYValueAtGraph(state.sliderValue * size.width, listOf)),
        6,
        thumbPaint2);
  }

  void drawGraph({
    required Canvas canvas,
    required Size size,
    required ScheduleV1 model,
  }) {
    getMaxXMaxY(model.values);
    double coefX = size.width / state.maxX;
    double coefY = size.height / state.maxY;
    final paint = Paint()
      ..color = model.colorGraph
      ..strokeWidth = model.widthGraph ?? 2;

    List<Offset> listOf = model.values
        .map((e) => Offset((e.x * coefX), -((e.y * coefY) - size.height)))
        .toList();
    canvas.drawPoints(PointMode.polygon, listOf, paint);
  }



  double getYValueAtGraph(double x, List<Offset> points) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i].dx <= x && points[i + 1].dx >= x) {
        final y1 = points[i].dy;
        final y2 = points[i + 1].dy;
        final x1 = points[i].dx;
        final x2 = points[i + 1].dx;
        //Лінійна інтерполяція  https://en.wikipedia.org/wiki/Linear_interpolation
        //Лінійний алгоритм Брезенхема  https://en.wikipedia.org/wiki/Bresenham's_line_algorithm
        final y = y1 * ((x2 - x) / (x2 - x1)) + y2 * ((x - x1) / (x2 - x1));
        return y;
      }
    }
    return 0.0;
  }
}

class CharV1WithAxisState {
  CharV1WithAxisState();

  double maxX = 0;
  double maxY = 0;
  double maxPlusCoefficientY = 1.25;
  double maxPlusCoefficientX = 1;
  late double widthFieldGiven;
  late double heightFieldGiven;
  double? widthForegroundGiven;
  double? heightForegroundGiven;
  double sliderValue = .5;
  GlobalKey keyOfField = GlobalKey(debugLabel: 'CharV1WithAxisState');
}