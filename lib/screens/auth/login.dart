import 'package:flutter/material.dart';
import 'package:esp_app/services/user.dart';

class Login extends StatefulWidget {
  
  final Function toggleViewFunction;
  final User user;

  Login({ this.toggleViewFunction, this.user });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Login"));
  }
}