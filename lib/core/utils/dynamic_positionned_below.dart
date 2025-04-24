import 'package:flutter/material.dart';

class DynamicPositionedBelow extends StatefulWidget {
  final Widget topChild;
  final Widget belowChild;

  const DynamicPositionedBelow({
    super.key,
    required this.topChild,
    required this.belowChild,
  });

  @override
  State<DynamicPositionedBelow> createState() => _DynamicPositionedBelowState();
}

class _DynamicPositionedBelowState extends State<DynamicPositionedBelow> {
  final GlobalKey _topKey = GlobalKey();
  double _measuredHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureTopChild());
  }

  void _measureTopChild() {
    final renderBox = _topKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        _measuredHeight = renderBox.size.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        KeyedSubtree(key: _topKey, child: widget.topChild),
        if (_measuredHeight > 0)
          Positioned(
            top: _measuredHeight + 10,
            left: 0,
            right: 0,
            child: widget.belowChild,
          ),
      ],
    );
  }
}
