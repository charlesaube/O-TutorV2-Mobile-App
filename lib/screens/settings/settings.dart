import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/screens/settings/blocs/settings_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/settings_container.dart';

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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [const Color(0x8829C3FF), const Color(0xff2944FF)],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                          color: Colors.grey.shade100),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/defaultAvatar.png",
                    height: 70,
                    width: 70,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Spacer(),
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SettingsContainer(onPressed: () {}, text: "Change Password"),
                  SettingsContainer(onPressed: () {}, text: "Change Email"),
                ],
              ),
              Spacer(),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width / 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate("Logout")
                          .toString(),
                      style: TextStyle(color: Colors.red, fontSize: 17),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
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
