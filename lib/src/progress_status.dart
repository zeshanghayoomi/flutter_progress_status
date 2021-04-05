import 'package:flutter/material.dart';
import 'package:flutter_progress_status/src/constants/constants.dart';
import 'package:flutter_progress_status/src/progress_status_painter.dart';
import 'package:flutter_progress_status/src/ui_toolkit/conditional_child.dart';

class ProgressStatus extends StatelessWidget {
  final double _radius;
  final double _fillValue;
  final Color _fillColor;
  final Color _backgroundColor;
  final bool _isStrokeCapRounded;
  final double _strokeWidth;
  final bool _showCenterText;
  final TextStyle _centerTextStyle;
  final Alignment _centerTextAlignment;

  const ProgressStatus(
      {double radius = 15.0,
      double fillValue = 0.0,
      Color fillColor = blueColor,
      Color backgroundColor = greyColor,
      bool isStrokeCapRounded = true,
      double strokeWidth = 5.0,
      bool showCenterText = true,
      TextStyle centerTextStyle,
      Alignment centerTextAlignment = Alignment.center})
      : _radius = radius * 2,
        _fillValue = fillValue,
        _fillColor = fillColor,
        _backgroundColor = backgroundColor,
        _isStrokeCapRounded = isStrokeCapRounded,
        _strokeWidth = strokeWidth,
        _showCenterText = showCenterText,
        _centerTextStyle = centerTextStyle,
        _centerTextAlignment = centerTextAlignment;

  @override
  Widget build(BuildContext context) {
    final dimension = _getDimension(context);

    return SizedBox(
      height: dimension,
      width: dimension,
      child: CustomPaint(
        painter: ProgressStatusPainter(
          fillValue: _getFillValue,
          fillColor: _fillColor,
          backgroundColor: _backgroundColor,
          isStrokeCapRounded: _isStrokeCapRounded,
          strokeWidth: _strokeWidth,
        ),
        child: ConditionalChild(
          condition: _showCenterText,
          thenBuilder: () => Align(
            alignment: _centerTextAlignment,
            child: Text(
              _getCenterText,
              style: _centerTextStyle ??
                  defaultCenterTextStyle.copyWith(fontSize: _radius / 3.8),
            ),
          ),
        ),
      ),
    );
  }

  double _getDimension(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    if (_radius < 30.0) {
      return 30.0;
    }

    if (_radius > deviceWidth) {
      return deviceWidth;
    }

    return _radius;
  }

  String get _getCenterText {
    if ((_fillValue ?? -1) < 0) {
      return '0.0%';
    }

    if (_fillValue > 100) {
      return '100%';
    }

    return '${_fillValue.toStringAsFixed(0)}%';
  }

  double get _getFillValue {
    if ((_fillValue ?? -1) < 0) {
      return 0.0;
    }

    if (_fillValue > 100) {
      return 100.0;
    }

    return _fillValue;
  }
}
