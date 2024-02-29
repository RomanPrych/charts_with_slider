
import 'package:charts_with_slider/core/constants/types_custom.dart';
import 'package:flutter/material.dart';

class ForegroundOptionsV1 {
  ForegroundOptionsV1({
    this.textStyleXHorizontal,
    this.textStyleYVertical,
    this.lineXHorizontal,
    this.lineYVertical,
    this.textPositionNearLine,
  });

  final List<POINT_DIGIT>? lineXHorizontal;
  final List<POINT_DIGIT>? lineYVertical;
  final TextStyle? textStyleXHorizontal;
  final TextStyle? textStyleYVertical;
  final TextPositionNearLine? textPositionNearLine;
}

enum TextPositionNearLine { under, over, center }
