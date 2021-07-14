import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/Category.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/navigation/navbar.dart';
import 'package:demo3/screens/quiz/browse_category.dart';
import 'package:demo3/screens/quiz/browse_quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPopUp extends StatelessWidget {
  final AsyncSnapshot<ApiResponse<List<Category>>> _snapshot;

  ErrorPopUp(this._snapshot);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 2),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            padding: EdgeInsets.only(bottom: 15),
            child: Image(image: AssetImage('assets/cloud.png')),
          ),
          Text("Oops!",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              )),
          if (AppLocalizations.of(context)!
                  .translate(_snapshot.data!.message)
                  .toString() !=
              "null")
            ErrorText(AppLocalizations.of(context)!
                .translate(_snapshot.data!.message)
                .toString())
          else
            ErrorText(_snapshot.data!.message),
          Spacer(
            flex: 1,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NavBar()));
              },
              child: Text("Try Again")),
          Spacer(),
        ],
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  final String _errrorMessage;

  const ErrorText(this._errrorMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _errrorMessage,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
      ),
    );
  }
}
