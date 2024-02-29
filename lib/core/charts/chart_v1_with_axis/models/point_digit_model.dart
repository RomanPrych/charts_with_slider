class PointDigitModel {
  PointDigitModel({
    required this.width,
    required this.height,
    required this.pointType,
    required this.position,
    required this.text,
  });

  final PointType pointType;
  final double position;
  final double width;
  final double height;
  final String text;
}

enum PointType { X, Y }
