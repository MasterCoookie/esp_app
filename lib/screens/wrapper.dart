import 'package:flutter/material.dart';
import 'package:esp_app/screens/home/home.dart';
import 'package:esp_app/services/user.dart';
import 'package:esp_app/screens/auth/authenticate.dart';

class Wrapper extends StatefulWidget {

  //potentially login from saved data
  User user = new User();

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {  
  void loginUser() {
    setState(() => this.widget.user.loggedIn = true );
  }

  @override
  Widget build(BuildContext context) {
    if(!widget.user.loggedIn) {
      return Authenticate(user: widget.user, loginUserFunction : loginUser);
    }
   return Home(user: widget.user);
  }
}