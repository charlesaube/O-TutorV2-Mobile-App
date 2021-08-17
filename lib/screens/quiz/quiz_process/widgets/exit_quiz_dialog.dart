import 'package:demo3/localization/app_localizations.dart';
import 'package:flutter/material.dart';

typedef void VoidCallback();

class ExitQuizDialog {
  BuildContext context;
  //final VoidCallback saveQuizAttemptCallback;
  ExitQuizDialog(
    this.context,
    /*this.saveQuizAttemptCallback*/
  );

  Future<String?> showMyDialog() {
    return showDialog<String>(
      //barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.amber),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;
              return Container(
                height: height / 2.5,
                width: width / 1.2,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                      width: double.infinity,
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.translate('Exit Quiz').toString(),
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(AppLocalizations.of(context)!.translate('Exit Quiz Message').toString(),
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.all(35),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            //Cancel button
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(AppLocalizations.of(context)!.translate('Cancel').toString(),
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                            ),
                          ),
                          Spacer(),
                          Container(
                            //Confirm button
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextButton(
                              onPressed: () {
                                //this.saveQuizAttemptCallback();
                                Navigator.pop(context);
                              },
                              child: Text(AppLocalizations.of(context)!.translate('Confirm').toString(),
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
