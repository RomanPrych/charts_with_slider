import 'package:charts_with_slider/core/charts/chart_v1_with_axis/chart_v1_with_axis_screen.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/models/foreground_options_v1.dart';
import 'package:charts_with_slider/core/charts/chart_v1_with_axis/provider/chart_v1_with_axis_provider.dart';
import 'package:charts_with_slider/core/constants/types_custom.dart';
import 'package:charts_with_slider/dependencies/export.dart';
import 'package:provider/provider.dart';

class ChartV1WithAxisModule extends StatelessWidget {
  const ChartV1WithAxisModule({
    super.key,
    required this.listLines,
    required this.width,
    required this.height,
    this.colorXYLine,
    this.widthXYLine,
    this.verticalLineColor,
    this.verticalLineWidth,
    this.foregroundOptionsV1,
  });

  final List<ScheduleV1> listLines;
  final double width;
  final double height;
  final Color? colorXYLine;
  final double? widthXYLine;
  final Color? verticalLineColor;
  final double? verticalLineWidth;
  final ForegroundOptionsV1? foregroundOptionsV1;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChartV1WithAxisProvider(
        widthMain: width,
        heightMain: height,
        listLines: listLines,
        colorXYLine: colorXYLine,
        widthXYLine: widthXYLine,
        verticalLineColor: verticalLineColor,
        verticalLineWidth: verticalLineWidth,
        foregroundOptionsV1: foregroundOptionsV1,
      ),
      child: const ChartV1WithAxisScreen(),
    );
  }
}
