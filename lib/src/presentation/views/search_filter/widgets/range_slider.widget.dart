import 'package:flutter/material.dart';

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({super.key});

  @override
  RangeSliderWidgetState createState() => RangeSliderWidgetState();
}

class RangeSliderWidgetState extends State<RangeSliderWidget> {
  //iniital value for start range and end range
  double startVal = 30, endVal = 70;

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 0,
      max: 200,
      divisions: 200, //slide interval
      activeColor: Theme.of(context).primaryColor,
      labels: RangeLabels("\$ $startVal", "\$ $endVal"),
      values: RangeValues(startVal, endVal),
      onChanged: (RangeValues value) {
        setState(() {
          startVal = value.start;
          endVal = value.end;
        });
      },
    );
  }
}
