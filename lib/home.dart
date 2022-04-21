import 'package:flutter/material.dart';
import 'package:state_management/color_circle.dart';

import 'color_value_changer.dart';

class ColorMixer extends StatefulWidget {
  const ColorMixer({
    Key? key,
  }) : super(key: key);

  @override
  State<ColorMixer> createState() => _ColorMixerState();
}

class _ColorMixerState extends State<ColorMixer> {
  int _red = 0;
  int _blue = 0;
  int _green = 0;

  void _setColor({String? property, int value = 0}) {
    setState(() {
      _red = property == "Red" ? value : _red;
      _green = property == "Green" ? value : _green;
      _blue = property == "Blue" ? value : _blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // This widget uses the variables (aka state)
              ColorCircle(
                colorvalue: Color.fromRGBO(_red, _blue, _green, 1),
                radius: 200,
              ),
              const SizedBox(height: 20),

              // These three pass the _setColor function down so that the
              // state *here* can be changed at lower levels. This is
              // called "lifting state up".
              ColorValueChanger(
                  property: "red",
                  colorvalue: _red,
                  color: Colors.red,
                  onChanged: (value) {
                    _setColor(
                      property: "Red",
                      value: _red = value.round(),
                    );
                  }),
              ColorValueChanger(
                  property: "Green",
                  color: Colors.green,
                  colorvalue: _green,
                  onChanged: (value) {
                    _setColor(
                      property: "Green",
                      value: _green = value.round(),
                    );
                  }),
              ColorValueChanger(
                  property: "Blue",
                  colorvalue: _blue,
                  color: Colors.blue,
                  onChanged: (value) {
                    _setColor(
                      property: "Blue",
                      value: _blue = value.round(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
