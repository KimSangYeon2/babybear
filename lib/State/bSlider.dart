import 'package:babybear/State/state.dart';
import 'package:flutter/material.dart';

class BSlider extends StatefulWidget {
  @override
  _BSliderState createState() => _BSliderState();
}

class _BSliderState extends State<BSlider> {
  double _brightnessValue = 0;
  final AppState _appstate = AppState();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Slider(
        value: _brightnessValue,
        min: 0,
        max: 255,
        onChanged: (double value) {
          setState(() {
            _brightnessValue = value;
          });
          setBrightness(value.toInt());
        },
      ),
    );
  }

  void setBrightness(int brightness) async {
    try {
      await _appstate.setBrightness(brightness);
    } catch (e) {
      print(e.toString());
    }
  }
}