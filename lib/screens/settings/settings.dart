import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/screens/settings/blocs/settings_bloc.dart';
import 'package:demo3/screens/settings/widgets/settings_form.dart';
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
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [const Color(0x8829C3FF), const Color(0xaa2196F3)],
              tileMode: TileMode.clamp),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.translate("Settings").toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.orange[700],
          ),
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
                    SettingsContainer(
                        onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Change Password'),
                                actions: <Widget>[
                                  SettingsForm(),
                                ],
                              ),
                            ),
                        text: "Change Password"),
                    SettingsContainer(onTap: () {}, text: "Change Email"),
                  ],
                ),
                Spacer(),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.translate("Logout").toString(),
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
      ),
    );
  }
}
