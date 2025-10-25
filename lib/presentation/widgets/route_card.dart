import 'package:flutter/material.dart';

class RouteCard extends StatelessWidget {
  final String title;
  const RouteCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(12.0), child: Text(title)),
    );
  }
}
