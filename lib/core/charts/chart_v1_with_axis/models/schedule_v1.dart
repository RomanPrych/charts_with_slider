import 'package:charts_with_slider/core/constants/types_custom.dart';
import 'package:charts_with_slider/dependencies/export.dart';

class ScheduleV1 {
  ScheduleV1({required this.values,required this.colorGraph,
    this.widthGraph,});

  List<POINT> values;
   Color colorGraph;
   double? widthGraph;
}
