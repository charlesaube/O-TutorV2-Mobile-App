import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/startup.dart';
import 'package:demo3/model/user.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IStartup_repository.dart';
import 'package:demo3/network/services/Impl/user_service.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:demo3/screens/dashboard_screen/blocs/startup_bloc.dart';
import 'package:demo3/screens/dashboard_screen/widgets/custom_container.dart';
import 'package:demo3/screens/dashboard_screen/widgets/dashboard_quiz_list.dart';
import 'package:demo3/screens/dashboard_screen/widgets/dashboard_title.dart';
import 'package:demo3/screens/dashboard_screen/widgets/header.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/dashboard_screen/widgets/weekly_goal.dart';
import 'package:demo3/screens/util/error_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardSate createState() {
    return DashboardSate();
  }
}

class DashboardSate extends State<DashboardPage> {
  StartupBloc? _bloc;
  late final UserService _userService = ServiceProvider().getUserService();
  final IStartupRepository _startupRepository =
      ServiceProvider().fetchStartupRepository();
  late Startup _startup;
  late User user;

  @override
  void initState() {
    super.initState();
    _bloc = StartupBloc();
  }

  void refresh() {
    setState(() {
      _bloc!.fetchStartup();
    });
  }

  fetchWeeklyGoal() {
    double percent = user.weeklyGoalProgress / user.weeklyGoal;
    return percent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size(370, (360 * 1.6666666666666667).toDouble()),
              painter: RPSCustomPainter(),
            ),
            RefreshIndicator(
                onRefresh: () => _bloc!.fetchStartup(),
                child: StreamBuilder<ApiResponse<Startup>>(
                    stream: _bloc!.startupStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.LOADING:
                            return SpinKitDoubleBounce(
                                color: Colors.lightBlue.shade100);
                            break;
                          case Status.COMPLETED:
                            user = snapshot.data!.data.user;
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.93,
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(child: Header(user)),
                                            CustomContainer(
                                              Stack(
                                                children: <Widget>[
                                                  DashboardTitle(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .translate('Quizzes')
                                                          .toString()),
                                                  Positioned(
                                                      top: 50.0,
                                                      left: 0,
                                                      right: 0.0,
                                                      bottom: 0.0,
                                                      child:
                                                          (DashboardQuizList())),
                                                ],
                                              ),
                                            ),
                                            CustomContainer(
                                              DashboardTitle(AppLocalizations
                                                      .of(context)!
                                                  .translate(
                                                      'Dashboard Statistics')
                                                  .toString()),
                                            ),
                                            WeaklyGoal(user),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          case Status.ERROR:
                            return ErrorPopUp(snapshot as dynamic, refresh);
                            break;
                        }
                      }
                      return SpinKitDoubleBounce(
                          color: Colors.lightBlue.shade100);
                    })),
          ],
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
