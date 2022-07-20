import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class User {
  String email;
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

  Future<bool> register(String email, String password) async {
    final headers = { 'Content-Type': 'application/json;charset=UTF-8' };

    Map<String, dynamic> data = {
      'email': email,
      'password': password
    };

    final url = "http://10.0.2.2:8080/user_create";

    final uri = Uri.parse(url);
    String jsonData = json.encode(data);
    final encoding = Encoding.getByName('utf-8');

    try {
      Response response = await post(
        uri,
        headers: headers,
        body: jsonData,
        encoding: encoding
      );

      int statusCode = response.statusCode;
      String responseBody = response.body;

      // print(statusCode);
      // print(responseBody);
      if(statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print(e.message);
      return false;
    }

    
  }
}