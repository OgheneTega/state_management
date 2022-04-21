import 'package:flutter/material.dart';

class ColorValueChanger extends StatelessWidget {
  final String property;
  final int colorvalue;
  final Color color;
  final Function(double) onChanged;
  const ColorValueChanger(
      {Key? key,
      required this.property,
      required this.colorvalue,
      required this.onChanged,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Text(property),
          Slider(
            min: 0,
            max: 255,
            thumbColor: color,
            divisions: 10,
            value: colorvalue.toDouble(),
            label: property,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
