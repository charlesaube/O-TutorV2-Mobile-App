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
      appBar: AppBar(
        title: Text('Hi Maxim!'),

        actions: [

        ],
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.93,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/6,

                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Text("Dashboard"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/6,

                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Text("Dashboard"),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
