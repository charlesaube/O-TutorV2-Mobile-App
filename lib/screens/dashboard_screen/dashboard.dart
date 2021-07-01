import 'package:demo3/screens/dashboard_screen/widgets/custom_container.dart';
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
                    Container( 
                      margin: EdgeInsets.all(10),
                      child: Text(
                      "Courses",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),),

                  ),
                  CustomContainer(
                    Text("Dashboard"),
                  ),
                  CustomContainer(
                    Text("Dashboard"),
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
