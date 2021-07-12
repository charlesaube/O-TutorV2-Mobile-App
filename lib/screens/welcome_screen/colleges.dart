import 'package:demo3/custom_painter/corner_wave.dart';
import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/college.dart';
import 'package:demo3/network/services/Impl/college_service.dart';
import 'package:demo3/screens/welcome_screen/welcome.dart';
import 'package:demo3/screens/welcome_screen/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Colleges extends StatefulWidget {
  @override
  _CollegesState createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  final CollegeService _collegesService = new CollegeService();
  String selectedCollege = 'Valleyfield';

  @override
  Widget build(BuildContext context) {
    List<College> colleges = _collegesService.getCollege();

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.93,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.translate("Choose College").toString(), style: TextStyle(fontSize: 17, color: Colors.orange),),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: SizedBox(
                          width: 200,
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
                        text: AppLocalizations.of(context)!
                            .translate('Next')
                            .toString(),
                        onPressed: () {
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
            ),
          ],
        ),
      ),
    );
  }
}