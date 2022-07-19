import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  
  final Function toggleViewFunction;

  Login({ this.toggleViewFunction });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Login"));
  }
}