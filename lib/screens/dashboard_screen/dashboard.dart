import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/screens/dashboard_screen/widgets/custom_container.dart';
import 'package:demo3/screens/dashboard_screen/widgets/dashboard_quiz_list.dart';
import 'package:demo3/screens/dashboard_screen/widgets/dashboard_title.dart';
import 'package:demo3/screens/dashboard_screen/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardSate createState() {
    return DashboardSate();
  }
}

class DashboardSate extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.93,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Header(),
                  CustomContainer(
                    Stack(
                      children: <Widget>[
                        DashboardTitle(AppLocalizations.of(context)!
                            .translate('Quizzes')
                            .toString()),
                        Positioned(
                          top: 50.0,
                          left: 0,
                          right: 0.0,
                          bottom: 0.0,
                          child: (DashboardQuizList())
                        ),
                      ],
                    ),
                  ),
                  CustomContainer(
                    DashboardTitle(AppLocalizations.of(context)!
                        .translate('Dashboard Statistics')
                        .toString()),
                  ),
                  CustomContainer(
                    DashboardTitle("Courses"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
