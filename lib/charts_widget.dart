import "package:charts_with_slider/core/charts/chart_v1_with_axis/models/foreground_options_v1.dart";
import "package:charts_with_slider/core/constants/types_custom.dart";

import "dependencies/export.dart";

abstract interface class ChartsWidget {
  static final ChartsInf _source = ChartsImpl();

  static Widget ChartV1WithAxis({
    required List<ScheduleV1> listLines,
    required double width,
    required double height,
    Color? colorXYLine,
    double? widthXYLine,
    Color? verticalLineColor,
    double? verticalLineWidth,
    ForegroundOptionsV1? foregroundOptionsV1,
  }) =>
      _source.ChartV1WithAxis(
        listLines: listLines,
        width: width,
        height: height,
        colorXYLine: colorXYLine,
        widthXYLine: widthXYLine,
        verticalLineWidth: verticalLineWidth,
        verticalLineColor: verticalLineColor,
        foregroundOptionsV1: foregroundOptionsV1,
      );
}
