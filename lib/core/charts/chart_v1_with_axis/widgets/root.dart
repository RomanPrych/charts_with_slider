import 'package:charts_with_slider/core/charts/chart_v1_with_axis/provider/chart_v1_with_axis_provider.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/widgets/chart_v1_background_custom_paint.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/widgets/chart_v1_custom_paint.dart';
import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  const Root(
    this.value, {
    super.key,
  });

  final ChartV1WithAxisProvider value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        value.changePositionVerticalLine(details.globalPosition.dx);
      },
      onHorizontalDragUpdate: (details) {
        value.changePositionVerticalLine(details.globalPosition.dx);
      },
      child: CustomPaint(
        key: value.state.keyOfField,
        foregroundPainter: ChartV1BackgroundCustomPaint(value),
        painter: ChartV1CustomPainter(value),
        size: Size(value.state.widthFieldGiven, value.state.heightFieldGiven),
      ),
    );
  }
}
