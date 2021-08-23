import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'custom_container.dart';
import 'dashboard_title.dart';

class WeaklyGoal extends StatelessWidget {
  final User _user;

  WeaklyGoal(this._user);

  fetchWeeklyGoal() {
    double percent = _user.weeklyGoalProgress / _user.weeklyGoal;
    return percent;
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      Stack(
        children: <Widget>[
          DashboardTitle(AppLocalizations.of(context)!.translate('Weekly Goal').toString()),
          Container(
            margin: EdgeInsets.only(top: 45, right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 8.0,
                  percent: fetchWeeklyGoal(),
                  backgroundColor: Colors.lightBlue.shade500,
                  center: new Text(
                    (fetchWeeklyGoal() * 100).toString() + "%",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  progressColor: Colors.orangeAccent,
                ),
                Text(
                  AppLocalizations.of(context)!.translate('Weekly Goal Sentence1').toString() +
                      _user.weeklyGoalProgress.toString() +
                      " " +
                      AppLocalizations.of(context)!.translate('Weekly Goal Sentence2').toString() +
                      _user.weeklyGoal.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
