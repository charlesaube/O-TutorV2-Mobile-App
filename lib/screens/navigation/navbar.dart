import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/screens/dashboard_screen/dashboard.dart';
import 'package:demo3/screens/forum/forum.dart';
import 'package:demo3/screens/quiz/quiz_browsing/browse_courses.dart';
import 'package:demo3/screens/quiz/quiz_process/quiz.dart';
import 'package:demo3/screens/quiz_assessment/create_self_assessments.dart';
import 'package:demo3/screens/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  NavBarState createState() {
    return NavBarState();
  }
}

class NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final tabs = [
    Center(child: DashboardPage()),
    Center(child: BrowseCoursesPage()),
    Center(child: CreateSelfAssessmentsPage()),
    Center(child: ForumPage()),
    Center(child: SettingsPage()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: AppLocalizations.of(context)!.translate("Navbar Dashboard").toString(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: AppLocalizations.of(context)!.translate("Quizzes").toString(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2),
            label: AppLocalizations.of(context)!.translate("Exercise").toString(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: AppLocalizations.of(context)!.translate("Navbar Forum").toString(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.translate("Navbar Settings").toString(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
