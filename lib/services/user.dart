import 'package:esp_app/services/api_element.dart';
import 'package:http/http.dart';
import 'dart:convert';

class User extends ApiElement {
  static String email;
  static String password;
  bool loggedIn;

  User() {
    this.loggedIn = false;
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
        User.email = email;
        User.password = password;
        return true;
      }
      return false;
    } catch (e) {
      print(e.message);
      return false;
    }
  }

  Future getUserDevices() async {
    Map<String, String> data = getAppendableAuth();

    final url = ApiElement.api_address + "get_user_devices";
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
        print(response.body);
        return true;
      } else if(statusCode == 204) {
        return null;
      }
      return false;
    } catch (e) {
      print(e.message);
      return false;
    }
  }
}