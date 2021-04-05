import 'package:flutter/material.dart';
import 'package:flutter_progress_status/src/constants/constants.dart';

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
      double strokeWidth,
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
    return Container(
      color: Colors.brown,
      child: SizedBox(
        height: _radius,
        width: _radius,
        child: Align(
          alignment: _centerTextAlignment,
          child: Text(
            '0%',
            style: _centerTextStyle ??
                defaultCenterTextStyle.copyWith(fontSize: _radius / 2.6),
          ),
        ),
      ),
    );
  }
}
