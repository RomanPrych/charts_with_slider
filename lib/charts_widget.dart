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
    List<POINT_DIGIT>? lineXHorizontal,
    List<POINT_DIGIT>? lineYVertical,
  }) =>
      _source.ChartV1WithAxis(
        listLines: listLines,
        width: width,
        height: height,
        colorXYLine: colorXYLine,
        widthXYLine: widthXYLine,
        verticalLineWidth: verticalLineWidth,
        verticalLineColor: verticalLineColor,
        lineYVertical: lineYVertical,
        lineXHorizontal: lineXHorizontal,
      );
}
