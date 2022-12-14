import 'package:flutter/material.dart';
import 'package:flutter_progress_status/src/constants/constants.dart';
import 'package:flutter_progress_status/src/progress_status_painter.dart';
import 'package:flutter_progress_status/src/ui_toolkit/conditional_child.dart';

class ProgressStatus extends StatefulWidget {
  final double _radius;
  final double _fillValue;
  final Color _fillColor;
  final Color _backgroundColor;
  final bool _isStrokeCapRounded;
  final double _strokeWidth;
  final bool _showCenterText;
  final TextStyle? _centerTextStyle;
  final Alignment _centerTextAlignment;
  final Duration _animationDuration;
  final Curve _animationCurve;

  const ProgressStatus(
      {double radius = 15.0,
      double fillValue = 0.0,
      Color fillColor = blueColor,
      Color backgroundColor = greyColor,
      bool isStrokeCapRounded = true,
      double strokeWidth = 5.0,
      bool showCenterText = true,
      TextStyle? centerTextStyle,
      Alignment centerTextAlignment = Alignment.center,
      Duration animationDuration = defaultDuration,
      Curve animationCurve = Curves.fastOutSlowIn})
      : _radius = radius * 2,
        _fillValue = fillValue,
        _fillColor = fillColor,
        _backgroundColor = backgroundColor,
        _isStrokeCapRounded = isStrokeCapRounded,
        _strokeWidth = strokeWidth,
        _showCenterText = showCenterText,
        _centerTextStyle = centerTextStyle,
        _centerTextAlignment = centerTextAlignment,
        _animationDuration = animationDuration,
        _animationCurve = animationCurve;

  @override
  _ProgressStatusState createState() => _ProgressStatusState();
}

class _ProgressStatusState extends State<ProgressStatus> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 100.0,
      value: _getFillValue,
      duration: defaultDuration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _handleAnimation();
    final dimension = _getDimension(context);

    return SizedBox(
      height: dimension,
      width: dimension,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return CustomPaint(
            painter: ProgressStatusPainter(
              fillValue: _controller.value,
              fillColor: widget._fillColor,
              backgroundColor: widget._backgroundColor,
              isStrokeCapRounded: widget._isStrokeCapRounded,
              strokeWidth: widget._strokeWidth,
            ),
            child: ConditionalChild(
              condition: widget._showCenterText,
              thenBuilder: () => Align(
                alignment: widget._centerTextAlignment,
                child: Text(
                  _getCenterCircleText,
                  style: _getCenterCircleTextStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double _getDimension(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    if (widget._radius < 30.0) {
      return 30.0;
    }

    if (widget._radius > deviceWidth) {
      return deviceWidth;
    }

    return widget._radius;
  }

  double get _getFillValue {
    if (widget._fillValue <= 0) {
      return 0.0;
    }

    if (widget._fillValue > 100) {
      return 100.0;
    }

    return widget._fillValue;
  }

  String get _getCenterCircleText {
    return '${_controller.value.toStringAsFixed(0)}%';
  }

  TextStyle get _getCenterCircleTextStyle {
    return widget._centerTextStyle ??
        defaultCenterTextStyle.copyWith(
          fontSize: _getDimension(context) / 3.8,
        );
  }

  void _handleAnimation() {
    if (_controller.value != _getFillValue) {
      _controller.animateTo(
        _getFillValue,
        duration: widget._animationDuration,
        curve: widget._animationCurve,
      );
    }
  }
}
