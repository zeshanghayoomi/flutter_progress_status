import 'package:flutter/material.dart';
import 'package:flutter_progress_status/src/constants/constants.dart';

class ProgressStatus extends StatelessWidget {
  final double _radius;
  final double _fillValue;
  final Color _fillColor;
  final Color _backgroundColor;
  final bool _isStrokeCapRounded;
  final bool _showCenterText;
  final TextStyle _centerTextStyle;

  const ProgressStatus(
      {double radius,
      double fillValue = 0.0,
      Color fillColor = blueColor,
      Color backgroundColor = greyColor,
      bool isStrokeCapRounded = true,
      bool showCenterText = true,
      TextStyle centerTextStyle = defaultCenterTextStyle})
      : _radius = radius,
        _fillValue = fillValue,
        _fillColor = fillColor,
        _backgroundColor = backgroundColor,
        _isStrokeCapRounded = isStrokeCapRounded,
        _showCenterText = showCenterText,
        _centerTextStyle = centerTextStyle;

  @override
  Widget build(BuildContext context) {
    return Text('Progress Status Widget');
  }
}
