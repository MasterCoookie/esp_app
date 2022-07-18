import 'package:flutter/material.dart';
import 'package:esp_app/screens/home/home.dart';
import 'package:esp_app/screens/auth/authenticate.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //if(user == null) {
      return Authenticate();
    //}
   // return Home();
  }
}