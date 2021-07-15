import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/navigation/navbar.dart';
import 'package:demo3/screens/welcome_screen/Bloc/authentication_bloc.dart';
import 'package:demo3/screens/welcome_screen/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  AuthenticationBloc? _bloc;
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = AuthenticationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<ApiResponse<String>>(
              stream: _bloc!.authStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data!.status) {
                    case Status.LOADING:
                      return SpinKitDoubleBounce(color: Colors.orange);
                    case Status.ERROR:
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            if (snapshot.data!.message.contains("400"))
                              Text(
                                AppLocalizations.of(context)!
                                    .translate("Login Error")
                                    .toString(),
                                style: TextStyle(color: Colors.red),
                              )
                          ],
                        ),
                      );
                    case Status.COMPLETED:

                      break;
                  }
                }
                return Container();
              }),
          Padding(
            child: TextFormField(
              controller: usernameController,
              decoration: new InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.account_circle_sharp),
                ),
                labelText: AppLocalizations.of(context)!
                    .translate("Username")
                    .toString(),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!
                          .translate("Username")
                          .toString() +
                      " " +
                      AppLocalizations.of(context)!
                          .translate("Is required")
                          .toString();
                }
                return null;
              },
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          ),
          Padding(
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: new InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.lock),
                ),
                labelText: AppLocalizations.of(context)!
                    .translate("Password")
                    .toString(),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!
                          .translate("Password")
                          .toString() +
                      " " +
                      AppLocalizations.of(context)!
                          .translate("Is required")
                          .toString();
                }
                return null;
              },
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15.0),
            child: LoginButton(
              text: AppLocalizations.of(context)!.translate("Login").toString(),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _bloc!.authenticate(
                      usernameController.text, passwordController.text);
                }
              },
            ),
          ),
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

class SignupForm extends StatefulWidget {
  @override
  SignupFormState createState() {
    return SignupFormState();
  }
}

class SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final passWordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            child: TextFormField(
              decoration: new InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.account_circle_sharp),
                ),
                labelText: AppLocalizations.of(context)!
                    .translate("Username")
                    .toString(),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!
                          .translate("Username")
                          .toString() +
                      AppLocalizations.of(context)!
                          .translate("Is required")
                          .toString();
                }
                return null;
              },
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          ),
          Padding(
            child: TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: passWordController,
              decoration: new InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.lock),
                ),
                labelText: AppLocalizations.of(context)!
                    .translate("Password")
                    .toString(),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!
                          .translate("Password")
                          .toString() +
                      AppLocalizations.of(context)!
                          .translate("Is required")
                          .toString();
                }
                return null;
              },
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          ),
          Padding(
            child: TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: new InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.lock),
                ),
                labelText: AppLocalizations.of(context)!
                    .translate("Confirm Password")
                    .toString(),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.orange, width: 2.0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!
                          .translate("Password")
                          .toString() +
                      AppLocalizations.of(context)!
                          .translate("Is required")
                          .toString();
                } else if (value != passWordController.text) {
                  return AppLocalizations.of(context)!
                      .translate("Passwords do not match")
                      .toString();
                }
                return null;
              },
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15.0),
            child: LoginButton(
              text:
                  AppLocalizations.of(context)!.translate("Sign up").toString(),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
