import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'glass_container.dart';

class FloatingPanel extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;
  final Offset initialOffset;

  const FloatingPanel({
    super.key,
    required this.child,
    this.width = 400,
    this.height = 300,
    this.initialOffset = const Offset(0, 0),
  });

  @override
  State<FloatingPanel> createState() => _FloatingPanelState();
}

class _FloatingPanelState extends State<FloatingPanel> {
  Offset _offset = Offset.zero;

  @override
  void initState() {
    super.initState();
    _offset = widget.initialOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _offset,
      child: GlassContainer(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(16),
        child: widget.child,
      ).animate(onPlay: (controller) => controller.repeat(reverse: true))
       .moveY(begin: -5, end: 5, duration: 3.seconds, curve: Curves.easeInOut),
    );
  }
}
