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
              
            )
          ],)
        )
      ),
    );
  }
}