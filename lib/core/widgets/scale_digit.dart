import 'package:charts_with_slider/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleDigit {
  static TextPainter addAxisDigit({
    required String text,
    required Size size,
    required Canvas canvas,
    required double x,
    required double y,
    TextStyle? textStyle
  }) {

    TextSpan textSpan = TextSpan(
      text: text,
      style: textStyle ?? defaultTextStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final offset = Offset(x, y);
    textPainter.paint(canvas, offset);
    return textPainter;
  }
}
