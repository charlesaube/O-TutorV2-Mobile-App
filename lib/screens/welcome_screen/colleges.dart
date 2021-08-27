import 'package:demo3/custom_painter/corner_wave.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/Category.dart';
import 'package:demo3/model/college.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/ICollege_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:demo3/screens/util/error_widget.dart';
import 'package:demo3/screens/welcome_screen/welcome.dart';
import 'package:demo3/screens/welcome_screen/widgets/buttons.dart';
import 'package:demo3/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Bloc/college_bloc.dart';
import 'login.dart';

class Colleges extends StatefulWidget {
  @override
  _CollegesState createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  String selectedCollege = '';
  List<College> colleges = [];
  CollegeBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CollegeBloc();
  }

  void refresh() {
    setState(() {
      _bloc!.fetchColleges();
    });
  }

  //trouve le id d'un college par nom car on ne peux pas stocker d'objet dans un buttondropdown
  int findIdOfCollege(String categoryName) {
    int id = 0;
    for (final e in colleges) {
      if (e.name == categoryName) id = e.id;
    }
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size(500, (500 * 0.4).toDouble()),
              painter: AbstractShapePainter(),
            ),
            Positioned(
              bottom: -150,
              right: -400,
              height: 150,
              width: 400,
              child: CustomPaint(
                size: Size(500, (600 * 0.5).toDouble()),
                painter: AbstractShape2Painter(),
              ),
            ),
            RefreshIndicator(
              onRefresh: () => _bloc!.fetchColleges(),
              child: StreamBuilder<ApiResponse<List<College>>>(
                  stream: _bloc!.collegeListStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data!.status) {
                        case Status.LOADING:
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SpinKitDoubleBounce(color: Colors.orange),
                          );
                        case Status.COMPLETED:
                          colleges = snapshot.data!.data;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.93,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.translate("Choose College").toString(),
                                      style: TextStyle(fontSize: 17, color: Colors.orange),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: SizedBox(
                                        width: 250,
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          hint: new Text("Select College"),
                                          value: selectedCollege,
                                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.orange,
                                          ),
                                          items: colleges.map((College value) {
                                            return DropdownMenuItem<String>(
                                              value: value.name,
                                              child: new Text(value.name),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedCollege = newValue!;
                                            });
                                            print(selectedCollege);
                                          },
                                        ),
                                      ),
                                    ),
                                    LoginButton(
                                      text: AppLocalizations.of(context)!.translate('Next').toString(),
                                      onPressed: () async {
                                        int collegeId = findIdOfCollege(selectedCollege);
                                        await SecureStorage.setCollegeId(collegeId.toString());
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginPage(collegeName: selectedCollege)),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        case Status.ERROR:
                          return ErrorPopUp(snapshot, refresh);
                      }
                    }
                    return Container(child: Text("No Data Error"));
                  }),
            ),
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
