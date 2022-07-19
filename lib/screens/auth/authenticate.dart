import 'package:flutter/material.dart';
import 'package:esp_app/screens/auth/login.dart';
import 'package:esp_app/screens/auth/register.dart';

class Authenticate extends StatefulWidget {

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
      return Container(child: Login(toggleViewFunction: toggleView));
    }
    return Container(child: Register(toggleViewFunction: toggleView));
  }
}