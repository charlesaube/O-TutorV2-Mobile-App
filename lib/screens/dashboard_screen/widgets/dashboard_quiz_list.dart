import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardQuizList extends StatelessWidget {
  final List<String> litems = ["Algèbre 1", "Trigonométrie", "Physique Quantique", "4", "5"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: litems.length,
          itemBuilder: (BuildContext context,
              int index,) {
            return Container(
              margin:
              EdgeInsets.only(left: 15, right: 15),
              height: 30,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    litems[index] + " (" + litems[index] + ")",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(Icons.navigate_next, color: Colors.white,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}