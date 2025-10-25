import 'package:flutter/material.dart';

class MapMarker extends StatelessWidget {
  final double size;
  const MapMarker({Key? key, this.size = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.directions_bus, size: size, color: Colors.red);
  }
}
