import 'dart:convert';

class ApiElement {
  String _id;
  static const headers = { 'Content-Type': 'application/json;charset=UTF-8' };
  static const api_address = "http://10.0.2.2:8080/";
  static final encoding = Encoding.getByName('utf-8');
}