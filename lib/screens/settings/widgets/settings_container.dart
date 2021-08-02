import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  final String _text;
  final VoidCallback _callback;
  SettingsContainer({required VoidCallback onTap, required String text})
      : this._callback = onTap,
        this._text = text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _callback,
      child: Container(
        color: Colors.white,
        height: 50,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(_text,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
