import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/screens/settings/blocs/settings_bloc.dart';
import 'package:demo3/screens/settings/blocs/widgets/settings_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsState createState() {
    return SettingsState();
  }
}

class SettingsState extends State<SettingsPage> {
  SettingsBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SettingsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 57,
                right: 17,
                left: 17,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!
                        .translate("Settings")
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(30),
              children: <Widget>[
                SettingsContainer(onPressed: () {}, text: "Change Password"),
                SettingsContainer(onPressed: () {}, text: "Change Email"),
              ],
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width / 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey.shade300),
                  bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.translate("Logout").toString(),
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
  }
}
