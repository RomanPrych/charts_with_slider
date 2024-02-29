import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/foreground_options_v1.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/schedule_v1.dart';
import 'package:charts_with_slider/core/constants/types_custom.dart';
import 'package:flutter/material.dart';

abstract interface class ChartsInf {
  Widget ChartV1WithAxis({
    required List<ScheduleV1> listLines,
    required double width,
    required double height,
    Color? colorXYLine,
    double? widthXYLine,
    Color? verticalLineColor,
    double? verticalLineWidth,
    ForegroundOptionsV1? foregroundOptionsV1,
  });
}
