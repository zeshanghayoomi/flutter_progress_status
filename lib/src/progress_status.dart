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
      {double radius = 15.0,
      double fillValue = 0.0,
      Color fillColor = blueColor,
      Color backgroundColor = greyColor,
      bool isStrokeCapRounded = true,
      bool showCenterText = true,
      TextStyle centerTextStyle = defaultCenterTextStyle})
      : _radius = radius * 2,
        _fillValue = fillValue,
        _fillColor = fillColor,
        _backgroundColor = backgroundColor,
        _isStrokeCapRounded = isStrokeCapRounded,
        _showCenterText = showCenterText,
        _centerTextStyle = centerTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: SizedBox(
        height: _radius,
        width: _radius,
        child: Center(
          child: Text(
            '0%',
            style: _centerTextStyle.copyWith(fontSize: _radius / 2.6),
          ),
        ),
      ),
    );
  }
}
