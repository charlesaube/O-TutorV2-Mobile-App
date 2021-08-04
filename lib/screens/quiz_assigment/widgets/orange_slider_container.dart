import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrangeSliderContainer extends StatefulWidget {
  double currentSliderValue;
  final double min;
  final double max;
  final int division;
  final String text;

  OrangeSliderContainer({
    required this.text,
    required this.currentSliderValue,
    required this.min,
    required this.max,
    required this.division,
  });

  @override
  _OrangeSliderContainerState createState() => _OrangeSliderContainerState();
}

class _OrangeSliderContainerState extends State<OrangeSliderContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(width: double.infinity, child: Text(widget.text)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.min.floor().toString()),
              Slider.adaptive(
                value: widget.currentSliderValue,
                activeColor: Colors.orange.shade500,
                inactiveColor: Colors.orange.shade100,
                label: widget.currentSliderValue.round().toString(),
                divisions: widget.division,
                min: widget.min,
                max: widget.max,
                onChanged: (double value) {
                  setState(() {
                    widget.currentSliderValue = value;
                  });
                },
              ),
              Text(widget.max.round().toString()),
            ],
          ),
        ],
      ),
    );
  }
}
