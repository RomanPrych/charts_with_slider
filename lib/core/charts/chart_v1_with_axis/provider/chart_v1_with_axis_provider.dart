import 'dart:math';
import 'dart:ui';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/foreground_options_v1.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/point_digit_model.dart';
import 'package:charts_with_slider/core/constants/constants.dart';
import 'package:charts_with_slider/core/constants/types_custom.dart';
import 'package:charts_with_slider/core/utils/get_text_widget_size.dart';
import 'package:charts_with_slider/core/widgets/scale_digit.dart';
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
    this.foregroundOptionsV1,

  }) {
    state.widthCanvas = widthMain;
    state.heightCanvas = heightMain;
    getMinusValues();
  }
  final ForegroundOptionsV1? foregroundOptionsV1;
  final double widthMain;
  final double heightMain;
  final List<ScheduleV1> listLines;
  final Color? colorXYLine;
  final double? widthXYLine;
  final Color? verticalLineColor;
  final double? verticalLineWidth;
  CharV1WithAxisState state = CharV1WithAxisState();

  void getMinusValues() {
    if (foregroundOptionsV1 == null ||
        foregroundOptionsV1?.lineXHorizontal == null ||
        foregroundOptionsV1?.lineYVertical == null) {
      return;
    }


    for (POINT_DIGIT element in foregroundOptionsV1?.lineXHorizontal ?? []) {
      Size size = GetTextWidgetSize.getTextWidgetSize(element.text,
          foregroundOptionsV1?.textStyleXHorizontal ?? defaultTextStyle);
      state.horizontalXHorizontalMinusValue = max(state.horizontalXHorizontalMinusValue, size.width);
      state.listPointsXLineHorizontal.add(
        PointDigitModel(
          width: size.width,
          height: size.height,
          pointType: PointType.X,
          position: element.value,
          text: element.text ?? '',
        ),
      );
    }

    for (POINT_DIGIT element in foregroundOptionsV1?.lineYVertical ?? []) {
      Size size = GetTextWidgetSize.getTextWidgetSize(element.text,
          foregroundOptionsV1?.textStyleYVertical ?? defaultTextStyle);
      state.verticalYVerticalMinusValue = max(state.verticalYVerticalMinusValue, size.height);
      state.listPointsYLineVertical.add(
        PointDigitModel(
          width: size.width,
          height: size.height,
          pointType: PointType.Y,
          position: element.value,
          text: element.text ?? '',
        ),
      );
    }
    state.verticalYVerticalMinusValue = state.verticalYVerticalMinusValue+10;
    state.horizontalXHorizontalMinusValue = state.horizontalXHorizontalMinusValue+10;
    refresh();
  }

  void drawScalesDigits(Canvas canvas){
    double coefX = getSizeCanvas.width / state.maxX;
    for(PointDigitModel elementX in state.listPointsXLineHorizontal){
      double horizontalCoef = 0;
      if(foregroundOptionsV1?.textPositionNearLineHorizontal == TextPositionNearLineHorizontal.center || foregroundOptionsV1?.textPositionNearLineHorizontal == null){
        horizontalCoef = (elementX.width/2);
      } else if (foregroundOptionsV1?.textPositionNearLineHorizontal == TextPositionNearLineHorizontal.right){
        horizontalCoef = 0;
      } else {
        horizontalCoef = elementX.width;
      }

      ScaleDigit.addAxisDigit(
        text: elementX.text,
        size: getSizeCanvas,
        canvas: canvas,
        x: (elementX.position*coefX) - horizontalCoef,
        y: getSizeCanvas.height,
      );
    }

    double coefY = getSizeCanvas.height / state.maxY;
    for(PointDigitModel elementX in state.listPointsYLineVertical){
      double verticalCoef = 0;
      if(foregroundOptionsV1?.textPositionNearLineVertical == TextPositionNearLineVertical.center || foregroundOptionsV1?.textPositionNearLineVertical == null){
        verticalCoef = (elementX.height/2);
      } else if (foregroundOptionsV1?.textPositionNearLineVertical == TextPositionNearLineVertical.over){
        verticalCoef = elementX.height;
      } else {
        verticalCoef = 0;
      }

      ScaleDigit.addAxisDigit(
        text: elementX.text,
        size: getSizeCanvas,
        canvas: canvas,
        x: -(elementX.width+3),
        y: -((elementX.position * coefY) - getSizeCanvas.height)-verticalCoef,
      );
    }
  }

  void drawBackgroundLinesVertical(Canvas canvas){
    double coefX = getSizeCanvas.width / state.maxX;
    for(PointDigitModel elementX in state.listPointsXLineHorizontal){
      final paint = Paint()
        ..color =  Colors.grey
        ..style = PaintingStyle.stroke
        ..strokeWidth = widthXYLine ?? 1;
         drawDashedLine(
          canvas: canvas,
          p1: Offset((elementX.position*coefX), getSizeCanvas.height),
          p2: Offset((elementX.position*coefX), 0),
          dashWidth: 6,
          dashSpace: 4,
          paint: paint,
      );
    }
  }

  void refresh(){
    try{
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        notifyListeners();
      });
    } catch (e){
      print('ERROR refresh = $e');
    }
  }

  void drawBackgroundLinesHorizontal(Canvas canvas){
    double coefY = getSizeCanvas.height / state.maxY;
    for(PointDigitModel elementY in state.listPointsYLineVertical){
      final paint = Paint()
        ..color =  Colors.grey
        ..style = PaintingStyle.stroke
        ..strokeWidth = widthXYLine ?? 1;
      drawDashedLine(
        canvas: canvas,
        p1: Offset(0, (getSizeCanvas.height-(elementY.position*coefY))),
        p2: Offset(getSizeCanvas.width, (getSizeCanvas.height-(elementY.position*coefY))),
        dashWidth: 6,
        dashSpace: 4,
        paint: paint,
      );
    }
  }

  void drawDashedLine(
      {required Canvas canvas,
        required Offset p1,
        required Offset p2,
        required int dashWidth,
        required int dashSpace,
        required Paint paint}) {
    // Get normalized distance vector from p1 to p2

    try{
      var dx = p2.dx - p1.dx;
      var dy = p2.dy - p1.dy;
      double magnitude = sqrt(dx * dx + dy * dy);
      dx = dx / magnitude;
      dy = dy / magnitude;

      // Compute number of dash segments

      int steps = magnitude ~/ (dashWidth + dashSpace);
      var startX = p1.dx;
      var startY = p1.dy;

      for (int i = 0; i < steps; i++) {
        final endX = startX + dx * dashWidth;
        final endY = startY + dy * dashWidth;
        canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
        startX += dx * (dashWidth + dashSpace);
        startY += dy * (dashWidth + dashSpace);
      }
    } catch (e){
      print('ERROR drawDashedLine =$e');
    }
  }

  Size get getSizeCanvas => Size(
      state.widthCanvas - state.horizontalXHorizontalMinusValue,
      state.heightCanvas - state.verticalYVerticalMinusValue);

  Size get getSizeMain => Size(state.widthCanvas, state.heightCanvas);

  void drawXYLine(Canvas canvas) {
    final paint = Paint()
      ..color = colorXYLine ?? Colors.black
      ..strokeWidth = widthXYLine ?? 1;

    canvas.drawLine(Offset(0, getSizeCanvas.height),
        Offset(getSizeCanvas.width, getSizeCanvas.height), paint);
    canvas.drawLine(const Offset(0, 0), Offset(0, getSizeCanvas.height), paint);
  }

  void drawVerticalLine(Canvas canvas) {
    final linePaint = Paint()
      ..color = verticalLineColor ?? Colors.blue
      ..strokeWidth = verticalLineWidth ?? 2.0;
    final lineStart =
        Offset(state.sliderValue * getSizeCanvas.width, getSizeCanvas.height);
    final lineEnd = Offset(state.sliderValue * getSizeCanvas.width, 0);
    canvas.drawLine(lineStart, lineEnd, linePaint);
  }

  void changePositionVerticalLine(double value) {
    try {
      RenderBox? ren =
          state.keyOfField.currentContext?.findRenderObject() as RenderBox;
      Offset offsetFirst = ren.localToGlobal(Offset.zero);
      double startPosition = offsetFirst.dx;
      double delta = value - startPosition;
      double calcPositionSliderValue = delta / state.widthCanvas;
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

  void drawAllGraphs(Canvas canvas) {
    for (final lineGraph in listLines) {
      drawGraph(
        canvas: canvas,
        size: getSizeCanvas,
        model: lineGraph,
      );
    }
    //need to do not display under lines
    for (final lineGraph in listLines) {
      drawPointOnGraph(canvas: canvas, size: getSizeCanvas, model: lineGraph);
    }
  }

  void drawPointOnGraph({
    required Canvas canvas,
    required Size size,
    required ScheduleV1 model,
  }) {
    final thumbPaint2 = Paint()
      ..color = model.colorGraph
      ..strokeWidth = 2.0;///todo
    //getMaxXMaxY(model.values);
    double coefX = size.width / (state.maxX-state.minX);
    double coefY = size.height / (state.maxY-state.minY);
    List<Offset> listOf = [];
    for (POINT e in model.values) {
      listOf.add(Offset(
        (e.x * coefX) - (coefX * state.minX),
        -((e.y * coefY)  - (state.minY * coefY)- size.height),
      ));
    }

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
    //getMaxXMaxY(model.values);
    double coefX = size.width / (state.maxX-state.minX);
    double coefY = size.height / (state.maxY-state.minY);
    final paint = Paint()
      ..color = model.colorGraph
      ..strokeCap = StrokeCap.round //round corners
      ..strokeWidth = model.widthGraph ?? 2;
    List<Offset> listOf = [];
    for (POINT e in model.values) {
      ///listOf.add(Offset((e.x * coefX), -((e.y * coefY) - size.height)));
      listOf.add(Offset(
        (e.x * coefX) - (coefX * state.minX),
        -((e.y * coefY)  - (state.minY * coefY)- size.height),
      ));
    }

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
  List <PointDigitModel> listPointsXLineHorizontal = [];
  List <PointDigitModel> listPointsYLineVertical = [];
  double horizontalXHorizontalMinusValue = 0;
  double verticalYVerticalMinusValue = 0;


  double maxX = 24;
  double maxY = 36;
  double minX = 0;
  double minY = 0;
  double maxPlusCoefficientY = 1.25;
  double maxPlusCoefficientX = 1;
  late double widthCanvas;
  late double heightCanvas;

  double sliderValue = .5;
  GlobalKey keyOfField = GlobalKey(debugLabel: 'CharV1WithAxisState');
}
