import 'package:charts_with_slider/core/charts/chart_v1_with_axis/chart_v1_with_axis_module.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/foreground_options_v1.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/schedule_v1.dart';
import 'package:charts_with_slider/core/charts_objects/charts_objects_interfase.dart';
import 'package:charts_with_slider/core/constants/types_custom.dart';
import 'package:flutter/material.dart';

class ChartsImpl implements ChartsInf {
  @override
  Widget ChartV1WithAxis({
    required List<ScheduleV1> listLines,
    required double width,
    required double height,
    Color? colorXYLine,
    double? widthXYLine,
    Color? verticalLineColor,
    double? verticalLineWidth,
    List<POINT_DIGIT>? lineXHorizontal,
    List<POINT_DIGIT>? lineYVertical,
    ForegroundOptionsV1? foregroundOptionsV1,
  }) =>
      ChartV1WithAxisModule(
        colorXYLine: colorXYLine,
        width: width,
        height: height,
        listLines: listLines,
        widthXYLine: widthXYLine,
        verticalLineColor: verticalLineColor,
        verticalLineWidth: verticalLineWidth,
        foregroundOptionsV1: foregroundOptionsV1,
      );
}
