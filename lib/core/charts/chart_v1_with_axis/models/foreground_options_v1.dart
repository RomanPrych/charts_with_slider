
import 'package:charts_with_slider/core/constants/types_custom.dart';
import 'package:flutter/material.dart';

class ForegroundOptionsV1 {
  ForegroundOptionsV1({
    this.textStyleXHorizontal,
    this.textStyleYVertical,
    this.lineXHorizontal,
    this.lineYVertical,
    this.textPositionNearLineVertical,
    this.textPositionNearLineHorizontal,
  });

  final List<POINT_DIGIT>? lineXHorizontal;
  final List<POINT_DIGIT>? lineYVertical;
  final TextStyle? textStyleXHorizontal;
  final TextStyle? textStyleYVertical;
  final TextPositionNearLineVertical? textPositionNearLineVertical;
  final TextPositionNearLineHorizontal? textPositionNearLineHorizontal;
}

enum TextPositionNearLineHorizontal { left, right, center }
enum TextPositionNearLineVertical { under, over, center }
