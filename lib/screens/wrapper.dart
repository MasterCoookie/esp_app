import 'package:flutter/material.dart';
import 'package:esp_app/screens/home/home.dart';
import 'package:esp_app/services/user.dart';
import 'package:esp_app/screens/auth/authenticate.dart';

class Wrapper extends StatelessWidget {

  //potentially login from saved data
  User user = new User();

  @override
  Widget build(BuildContext context) {
    if(!user.loggedIn) {
      return Authenticate();
    }
   return Home();
  }
}