import 'package:flutter/material.dart';
import 'package:http/http.dart';

class User {
  String username;
  String password;
  String _id;
  bool loggedIn;

  User() {
    this.loggedIn = false;
  }

  void login(String username, String password) {
    //TODO
    this.loggedIn = true;
  }
}