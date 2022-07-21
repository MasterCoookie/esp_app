import 'package:esp_app/services/api_element.dart';
import 'package:http/http.dart';
import 'dart:convert';

class User extends ApiElement {
  String email;
  String password;
  bool loggedIn;

  User() {
    this.loggedIn = false;
  }

  void login(String username, String password) {
    //TODO
    this.loggedIn = true;
  }

  Future<bool> apiRegister(String email, String password) async {

    Map<String, dynamic> data = {
      'email': email,
      'password': password
    };

    final url = ApiElement.api_address + "user_create";

    final uri = Uri.parse(url);
    String jsonData = json.encode(data);

    try {
      Response response = await post(
        uri,
        headers: ApiElement.headers,
        body: jsonData,
        encoding: ApiElement.encoding
      );

      int statusCode = response.statusCode;
      //String responseBody = response.body;

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

  Future<bool> apiLogin(String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password
    };
    
    final url = ApiElement.api_address + "user_check";
    final uri = Uri.parse(url);
    String jsonData = json.encode(data);

    try {
      Response response = await post(
        uri,
        headers: ApiElement.headers,
        body: jsonData,
        encoding: ApiElement.encoding
      );

      int statusCode = response.statusCode;

      if(statusCode == 200) {
        this.email = email;
        this.password = password;
        this.loggedIn = true;
        return true;
      }
      return false;
    } catch (e) {
      print(e.message);
      return false;
    }
  }
}