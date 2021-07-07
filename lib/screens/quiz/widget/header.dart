import 'package:demo3/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderCategory extends StatelessWidget {
  final String _title;

  HeaderCategory(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 57,
        right: 17,
        left: 17,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          AppLocalizations.of(context)!.translate(_title).toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        if (_title == "Quiz")
          TextButton(
            child: Text(
              AppLocalizations.of(context)!.translate("Back").toString(),
              style: TextStyle(color: Colors.blueAccent.shade700, fontSize: 17),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      ]),
    );
  }
}
