import 'package:demo3/Screens/DashBoardScreen/dashboard.dart';
import 'package:demo3/Screens/WelcomeScreen/login.dart';
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
    Center(child: Text("allo3")),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My Quizzes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
