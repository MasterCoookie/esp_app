import 'package:flutter/material.dart';
import 'package:esp_app/screens/auth/login.dart';
import 'package:esp_app/screens/auth/register.dart';
import 'package:esp_app/services/user.dart';

class Authenticate extends StatefulWidget {
  final User user;
  Function loginUserFunction;
  Authenticate({ this.user, this.loginUserFunction });

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogin = false;
  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLogin) {
      return Container(child: Login(toggleViewFunction: toggleView, user: widget.user, loginUserFunction : widget.loginUserFunction));
    }
    return Container(child: Register(toggleViewFunction: toggleView, loginUserFunction : widget.loginUserFunction ));
  }
}