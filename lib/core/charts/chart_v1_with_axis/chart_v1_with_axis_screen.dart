import 'package:charts_with_slider/core/charts/chart_v1_with_axis/provider/chart_v1_with_axis_provider.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/widgets/root.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartV1WithAxisScreen extends StatelessWidget {
  const ChartV1WithAxisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChartV1WithAxisProvider>(
      builder: (context, value, child) => Root(value),
    );
  }
}
