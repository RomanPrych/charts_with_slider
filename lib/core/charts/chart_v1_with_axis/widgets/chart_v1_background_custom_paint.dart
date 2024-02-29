import 'package:charts_with_slider/core/charts/chart_v1_with_axis/provider/chart_v1_with_axis_provider.dart';
import 'package:charts_with_slider/core/widgets/scale_digit.dart';
import 'package:flutter/widgets.dart';

class ChartV1BackgroundCustomPaint extends CustomPainter {
  ChartV1BackgroundCustomPaint(this.value);
  final ChartV1WithAxisProvider value;

  @override
  void paint(Canvas canvas, Size size) {
    ScaleDigit.addAxisDigit(text: 'text', size: size, canvas: canvas, x: 0, y: 0);
    ScaleDigit.addAxisDigit(text: 'text', size: size, canvas: canvas, x: size.width, y: 0);
    ScaleDigit.addAxisDigit(text: 'text', size: size, canvas: canvas, x: size.width, y: size.height);
    ScaleDigit.addAxisDigit(text: 'text', size: size, canvas: canvas, x: 0, y: size.height);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}