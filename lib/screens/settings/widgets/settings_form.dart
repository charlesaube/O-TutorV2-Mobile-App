import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/settings/blocs/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  SettingsBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SettingsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StreamBuilder<ApiResponse<String>>(
              stream: _bloc!.settingsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return SpinKitDoubleBounce(
                          color: Colors.lightBlue.shade100);
                    case Status.ERROR:
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              snapshot.data!.message.toString(),
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      );
                    case Status.COMPLETED:
                      return Text(
                        "Succesful",
                        style: TextStyle(color: Colors.black),
                      );
                      break;
                  }
                }
                return Container();
              }),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: oldPasswordController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!
                    .translate("Previous Password")
                    .toString(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: newPasswordController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!
                    .translate("New Password")
                    .toString(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  },
                  child: Text(AppLocalizations.of(context)!
                      .translate('Cancel')
                      .toString()),
                ),
                TextButton(
                  onPressed: () {
                    _bloc!.updatePassword(
                        oldPasswordController.text, newPasswordController.text);
                  },
                  child: Text(AppLocalizations.of(context)!
                      .translate('Change Password')
                      .toString()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
  }
}
