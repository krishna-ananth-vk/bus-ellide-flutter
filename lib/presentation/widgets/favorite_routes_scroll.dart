import 'package:flutter/material.dart';

class FavoriteRoutesScroll extends StatelessWidget {
  const FavoriteRoutesScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 0, // TODO: wire real data
        itemBuilder: (context, index) => const SizedBox.shrink(),
      ),
    );
  }
}
