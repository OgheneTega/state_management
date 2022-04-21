import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  final Color colorvalue;
  final double radius;
  const ColorCircle({Key? key, required this.colorvalue, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: colorvalue),
    );
  }
}
