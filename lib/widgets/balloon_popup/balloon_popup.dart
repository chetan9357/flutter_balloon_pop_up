import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/utils/popup_position.dart';
import 'balloon_arrow_painter.dart';
import 'balloon_popup_controller.dart';

class BalloonPopup extends StatefulWidget {
  final Widget child;
  final String message;
  final PopupPosition position;
  final BalloonPopupController controller;

  /// 🎨 Custom styles
  final Color backgroundColor;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final double borderRadius;

  const BalloonPopup({
    super.key,
    required this.child,
    required this.message,
    required this.controller,
    this.position = PopupPosition.top,
    this.backgroundColor = const Color(0xFF323232),
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 13,
    ),
    this.padding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    this.borderRadius = 12,
  });

  @override
  State<BalloonPopup> createState() => _BalloonPopupState();
}

class _BalloonPopupState extends State<BalloonPopup>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    widget.controller.bind(
      show: () {
        setState(() => _visible = true);
        _animationController.forward();
      },
      hide: () async {
        await _animationController.reverse();
        if (mounted) {
          setState(() => _visible = false);
        }
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.position == PopupPosition.left ||
        widget.position == PopupPosition.right) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: _horizontalLayout(),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _verticalLayout(),
    );
  }

  // ---------- Vertical (Top / Bottom) ----------
  List<Widget> _verticalLayout() {
    return [
      if (_visible && widget.position == PopupPosition.top)
        _popupVertical(isUp: true),

      widget.child,

      if (_visible && widget.position == PopupPosition.bottom)
        _popupVertical(isUp: false),
    ];
  }

  Widget _popupVertical({required bool isUp}) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Column(
          children: [
            if (!isUp)
              _arrow(rotationDegree: 180),

            _content(),

            if (isUp)
              _arrow(rotationDegree: 0),
          ],
        ),
      ),
    );
  }

  // ---------- Horizontal (Left / Right) ----------
  List<Widget> _horizontalLayout() {
    return [
      if (_visible && widget.position == PopupPosition.left)
        _popupHorizontal(isLeft: true),

      widget.child,

      if (_visible && widget.position == PopupPosition.right)
        _popupHorizontal(isLeft: false),
    ];
  }

  Widget _popupHorizontal({required bool isLeft}) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Row(
          children: [
            if (!isLeft)
              _arrow(rotationDegree: 90),

            _content(),

            if (isLeft)
              _arrow(rotationDegree: -90),
          ],
        ),
      ),
    );
  }

  // ---------- Common content ----------
  Widget _content() {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Text(
        widget.message,
        style: widget.textStyle,
      ),
    );
  }

  // ---------- Arrow ----------
  Widget _arrow({required double rotationDegree}) {
    return Transform.rotate(
      angle: rotationDegree * pi / 180,
      child: CustomPaint(
        size: const Size(16, 8),
        painter: BalloonArrowPainter(
          color: widget.backgroundColor,
          isUp: true,
        ),
      ),
    );
  }
}
