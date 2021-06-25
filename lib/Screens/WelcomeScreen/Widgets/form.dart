import 'package:demo3/Screens/WelcomeScreen/Widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();



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
                labelText: "Username",
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
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
                  return 'Username Is Required';
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
              decoration: new InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.lock),
                ),
                labelText: "Password",
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
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
                  return 'Password Is Required';
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
              text: "Login",
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
                labelText: "Username",
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
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
                  return 'Username Is Required';
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
                labelText: "Password",
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
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
                  return 'Password Is Required';
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
                labelText: "Confirm Password",
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2.0),
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
                  return 'Password Is Required';
                }else if(value !=  passWordController.text){
                  return 'Password do not match';
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
              text: "Sign up",
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

