import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void VoidCallback(double value);

class OrangeSliderContainer extends StatefulWidget {
  double currentSliderValue;
  final double min;
  final double max;
  final int division;
  final String text;
  final VoidCallback onChangedCallback;

  OrangeSliderContainer({
    required this.text,
    required this.currentSliderValue,
    required this.min,
    required this.max,
    required this.division,
    required this.onChangedCallback,
  });

  @override
  _OrangeSliderContainerState createState() => _OrangeSliderContainerState();
}

class _OrangeSliderContainerState extends State<OrangeSliderContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(text: widget.text + ":", style: TextStyle(fontSize: 15)),
                TextSpan(
                    text: " " + widget.currentSliderValue.floor().toString(),
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.min.floor().toString(), style: TextStyle(fontSize: 15)),
              Slider.adaptive(
                  value: widget.currentSliderValue,
                  activeColor: Colors.orangeAccent,
                  inactiveColor: Colors.orange.shade100,
                  label: widget.currentSliderValue.round().toString(),
                  divisions: widget.division,
                  min: widget.min,
                  max: widget.max,
                  onChanged: widget.onChangedCallback),
              Text(widget.max.round().toString(), style: TextStyle(fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }
}
