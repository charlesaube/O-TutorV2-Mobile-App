import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  final String _text;
  final VoidCallback _callback;

  SettingsContainer({required VoidCallback onPressed, required String text})
      : this._callback = onPressed,
        this._text = text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          TextButton(
            onPressed: _callback,
            child: Text(_text, style: TextStyle(color: Colors.grey.shade700)),
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}
