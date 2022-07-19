import 'package:flutter/material.dart';
import 'package:esp_app/constants.dart';

class Register extends StatefulWidget {

  final Function toggleViewFunction;

  Register({ this.toggleViewFunction });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String passwordRepeated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text("Register"),
        //elevation: 0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.login, color: Colors.white),
            onPressed: () { widget.toggleViewFunction(); },
            label: Text("Login", style: TextStyle(color: Colors.white))
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputFieldDecoration.copyWith(hintText: "Email"),
              cursorColor: Colors.orange,
              keyboardType: TextInputType.emailAddress,
              validator: (val) => val.isEmpty ? 'Enter Email' : null,
              onChanged: (val) {
                setState(() => email = val);
              },
            ), SizedBox(height:10), TextFormField(
              decoration: textInputFieldDecoration.copyWith(hintText: "Password"),
              cursorColor: Colors.orange,
              obscureText: true,
              validator: (val) => val.length < 8 || val.length > 24 ? 'Password must be between 8 and 24 characters long' : null,
              onChanged: (val) {
                setState(() => password = val);
              },
            ), SizedBox(height:10), TextFormField(
              decoration: textInputFieldDecoration.copyWith(hintText: "Repeat Password"),
              cursorColor: Colors.orange,
              obscureText: true,
              validator: (val) => val != password ? 'Passwords dont match' : null,
              onChanged: (val) {
                setState(() => passwordRepeated = val);
              },
            ), SizedBox(height:10),
            ElevatedButton(
              child: Text('Register', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange[600])),
              onPressed: () async {
                if(_formKey.currentState.validate()) {
                  print('dupa');
                } else {
                  print('nie dupa');
                }
              }
            )
          ], )
        )
      ),
    );
  }
}