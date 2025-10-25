import 'package:flutter/material.dart';

class NeubrutalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const NeubrutalButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(),
      child: child,
    );
  }
}
