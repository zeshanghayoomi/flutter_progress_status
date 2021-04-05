import 'package:flutter/material.dart';

class ProgressStatusPainter extends CustomPainter {
  final double _fillValue;
  final Color _fillColor;
  final Color _backgroundColor;
  final bool _isStrokeCapRounded;
  final double _strokeWidth;

  const ProgressStatusPainter(
      {@required double fillValue,
      @required Color fillColor,
      @required Color backgroundColor,
      @required bool isStrokeCapRounded,
      @required double strokeWidth})
      : _fillValue = fillValue,
        _fillColor = fillColor,
        _backgroundColor = backgroundColor,
        _isStrokeCapRounded = isStrokeCapRounded,
        _strokeWidth = strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = _getPaint(_backgroundColor);

    // draw background circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      (size.height - _strokeWidth) / 2,
      bgPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  Paint _getPaint(Color color) {
    return Paint()
      ..color = color
      ..strokeCap = _isStrokeCapRounded ? StrokeCap.round : StrokeCap.square
      ..strokeWidth = _strokeWidth
      ..style = PaintingStyle.stroke;
  }
}
