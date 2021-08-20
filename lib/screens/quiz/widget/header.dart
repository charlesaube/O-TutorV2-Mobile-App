import 'package:demo3/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderCategory extends StatelessWidget {
  final String _title;
  final String _headerType;

  HeaderCategory(this._title, this._headerType);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        _headerType == "Quiz" ? _title : AppLocalizations.of(context)!.translate(_headerType).toString(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
      ),
      automaticallyImplyLeading: _headerType == "Quiz",
      backgroundColor: Colors.orange,
    );
  }
}
