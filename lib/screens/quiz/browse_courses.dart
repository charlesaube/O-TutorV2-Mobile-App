import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/Category.dart';
import 'package:demo3/model/group.dart';
import 'package:demo3/model/startup.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/ICategory_repository.dart';
import 'package:demo3/network/services/Impl/category_service.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:demo3/screens/dashboard_screen/blocs/startup_bloc.dart';
import 'package:demo3/custom_painter/bg_circles.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:demo3/screens/quiz/widget/header.dart';
import 'package:demo3/screens/quiz/widget/list_container.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'browse_quiz.dart';

class BrowseCoursesPage extends StatefulWidget {
  @override
  _BrowseCoursesState createState() {
    return _BrowseCoursesState();
  }
}

class _BrowseCoursesState extends State<BrowseCoursesPage> {
  StartupBloc? _bloc;
  late List<Group> _groups;

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -600,
            right: -350,
            child: CustomPaint(
              size: Size(370, (360 * 1.6666666666666667).toDouble()),
              painter: RPSCustomPainter180(),
            ),
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
                         _groups = snapshot.data!.data.groups;

                         return SingleChildScrollView(
                           child: Column(
                             children: <Widget>[
                               Container(
                                 width: MediaQuery.of(context).size.width,
                                 height: MediaQuery.of(context).size.height,
                                 child: Column(
                                   children: <Widget>[
                                     HeaderCategory("Cours"),
                                     ListView.builder(
                                       scrollDirection: Axis.vertical,
                                       shrinkWrap: true,
                                       physics: BouncingScrollPhysics(),
                                       itemCount: _groups.length,
                                       itemBuilder: (
                                           BuildContext context,
                                           int index,
                                           ) {
                                         return GestureDetector(
                                           onTap: () {
                                             print(_groups[index]
                                                 .courseName);
                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(
                                                 builder: (context) =>
                                                     BrowseQuizPage(
                                                        groupId: _groups[index].id,),
                                               ),
                                             );
                                           },
                                           child: CoursesListContainer(
                                               _groups[index]),
                                         );
                                       },
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         );
                         break;
                      case Status.ERROR:
                        return ErrorPopUp(snapshot, refresh);
                        break;
                    }
                  }
                  return Container();
                }),
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
  }
}
