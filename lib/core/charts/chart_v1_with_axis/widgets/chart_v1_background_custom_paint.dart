import 'package:charts_with_slider/core/charts/chart_v1_with_axis/provider/chart_v1_with_axis_provider.dart';
import 'package:flutter/widgets.dart';

class ChartV1BackgroundCustomPaint extends CustomPainter {
  ChartV1BackgroundCustomPaint(this.value);
  final ChartV1WithAxisProvider value;

  @override
  void paint(Canvas canvas, Size size) {

    value.drawScalesDigits(canvas);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}