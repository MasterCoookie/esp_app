import 'dart:convert';
import 'package:esp_app/services/user.dart';

class ApiElement {
  String _id;
  static const headers = { 'Content-Type': 'application/json;charset=UTF-8' };
  static const api_address = "https://192.168.0.174:8080/";
  // static const api_address = "http://10.0.2.2:8080/";
  static final encoding = Encoding.getByName('utf-8');

  Map<String, String> getAppendableAuth() {
    Map<String, String> credentials =  {
      'email': User.email,
      'password': User.password
    };
    return credentials;
  }

  String get id { return _id; }

  set id(String id) { this._id = id; }
}