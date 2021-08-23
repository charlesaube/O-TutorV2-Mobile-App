import 'package:demo3/localization/app_localizations.dart';
import 'package:demo3/model/user.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/screens/welcome_screen/Bloc/authentication_bloc.dart';
import 'package:demo3/screens/welcome_screen/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Header extends StatefulWidget {
  final User _user;

  Header(this._user);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with TickerProviderStateMixin {
  late AuthenticationBloc? _bloc;

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.forward();
    super.initState();
    _bloc = AuthenticationBloc();
  }

  //Retourne une image par défault si l'image est null
  String fetchProfilPicture() {
    if (widget._user.profileImage != null) {
      return widget._user.profileImage;
    }
    return 'assets/defaultAvatar.png';
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1.5, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      )),
      child: Container(
        margin: EdgeInsets.only(top: 50, right: 17, left: 17, bottom: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Bonjour " + widget._user.firstName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          InkWell(
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text(AppLocalizations.of(context)!.translate('Logout').toString()),
                content: Text(AppLocalizations.of(context)!.translate('Confirmation Logout').toString()),
                actions: <Widget>[
                  StreamBuilder<ApiResponse<String>>(
                      stream: _bloc!.authStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          switch (snapshot.data!.status) {
                            case Status.COMPLETED:
                              SchedulerBinding.instance!.addPostFrameCallback((_) {
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => WelcomePage()));
                              });
                              break;
                          }
                        }
                        return Container();
                      }),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text(AppLocalizations.of(context)!.translate('Cancel').toString()),
                  ),
                  TextButton(
                    onPressed: () {
                      _bloc!.logout();
                    },
                    child: Text(AppLocalizations.of(context)!.translate('Confirm').toString()),
                  ),
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                fetchProfilPicture(),
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc!.dispose();
    _animationController.dispose();
  }
}
