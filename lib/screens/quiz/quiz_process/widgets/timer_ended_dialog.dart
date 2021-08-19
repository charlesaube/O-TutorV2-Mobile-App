import 'package:demo3/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class TimerEndedDialog {
  BuildContext context;
  TimerEndedDialog(this.context);

  static Future<String?> showMyDialog(BuildContext context) {
    return showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.orange,
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
                height: height / 2,
                width: width / 1.2,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: Icon(
                              Icons.timer,
                              size: 60,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          Text(
                            AppLocalizations.of(context)!.translate('Time Up').toString(),
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(AppLocalizations.of(context)!.translate('Time Up Message').toString(),
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
