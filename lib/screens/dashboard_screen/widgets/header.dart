import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/Impl/user_service.dart';
import 'package:demo3/screens/welcome_screen/Bloc/authentication_bloc.dart';
import 'package:demo3/screens/welcome_screen/welcome.dart';
import 'package:demo3/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Header extends StatefulWidget {



  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late AuthenticationBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AuthenticationBloc();
  }

  @override
  Widget build(BuildContext context) {
    final UserService userService = new UserService();
    return Container(
      margin: EdgeInsets.only(top: 50, right: 17, left: 17, bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          userService.fetchUserById(1).firstName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),

        InkWell(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('Logout'),
              content: const Text('Do you really want to logout?'),
              actions: <Widget>[
                StreamBuilder<ApiResponse<String>>(
                    stream: _bloc!.authStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.COMPLETED:

                            SchedulerBinding.instance!.addPostFrameCallback((_) {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => WelcomePage()));
                            });
                            break;
                        }
                      }
                      return Container();
                    }),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _bloc!.logout();
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/pdp.jpg',
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
  }
}
