import 'dart:ui';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/provider/chart_v1_with_axis_provider.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/widgets/chart_v1_background_custom_paint.dart';
import 'package:charts_with_slider/core/widgets/scale_digit.dart';
import 'package:flutter/material.dart';

class ChartV1CustomPainter extends CustomPainter {
  ChartV1CustomPainter(this.value);

  final ChartV1WithAxisProvider value;

  @override
  void paint(Canvas canvas, Size size) {
    value.drawXYLine(canvas);
    value.drawVerticalLine(canvas);
    value.drawBackgroundLinesVertical(canvas);

    value.drawAllGraphs(canvas);

    ///   /////////////////////////////////





//////////////////////////////////////

/////////////////////////////////////////////

    final thumbRadius = 10.0;
    final thumbCenter =
        Offset(value.state.sliderValue * size.width, size.height + 10);
    final thumbPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0;


    canvas.drawCircle(thumbCenter, thumbRadius, thumbPaint);




    // Get the y-value at the intersection of the line and the graph
    // ScaleDigit.addAxisDigit(
    //     size: size,
    //     canvas: canvas,
    //     x: value.state.sliderValue * size.width,
    //     y: value.getYValueAtX(value.state.sliderValue * size.width, listOf),
    //     text:
    //         'x = ${value.state.sliderValue * maxX} \ny= ${size.height - value.getYValueAtX(value.state.sliderValue * size.width, listOf)}');
  }

  @override
  bool shouldRepaint(ChartV1CustomPainter oldDelegate) => true;
}
