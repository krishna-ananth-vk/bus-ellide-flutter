import 'package:bus_ellide_mobile/core/themes/theme.dart';
import 'package:flutter/material.dart';

class NeubrutalCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  const NeubrutalCard({
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.radius = 12,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: neubrutalDecoration(radius: radius),
      child: child,
    );
  }
}
