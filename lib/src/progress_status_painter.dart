import 'dart:math';

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
    final fgPaint = _getPaint(_fillColor);
    final width = size.width;
    final height = size.height;
    final circleRadius = (height - _strokeWidth) / 2;

    // draw background circle
    canvas.drawCircle(Offset(width / 2, height / 2), circleRadius, bgPaint);

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(width / 2, height / 2),
        radius: circleRadius,
      ),
      _getStartAngle,
      _getSweepAngle,
      false,
      fgPaint,
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

  double get _getStartAngle {
    return (pi / 180) * 270;
  }

  double get _getSweepAngle {
    if (_fillValue == 100) {
      return (pi / 180) * ((_fillValue / 100) * 360);
    }

    return (pi / 180) * ((_fillValue / 100) * 354);
  }
}
