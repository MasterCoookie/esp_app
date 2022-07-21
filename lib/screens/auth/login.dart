import 'package:flutter/material.dart';
import 'package:esp_app/services/user.dart';
import 'package:esp_app/constants.dart';

class Login extends StatefulWidget {
  
  final Function toggleViewFunction;
  final User user;

  Login({ this.toggleViewFunction, this.user });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

   final _formKey = GlobalKey<FormState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorPalette["secondary"]),
      appBar: AppBar(
        backgroundColor: Color(colorPalette["primary"]),
        title: Text("Login"),
        //elevation: 0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () { widget.toggleViewFunction(); },
            label: Text("Register", style: TextStyle(color: Colors.white))
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
              validator: (val) => val.isEmpty ? 'Enter Password' : null,
              onChanged: (val) {
                setState(() => password = val);
              },
            ), SizedBox(height:5),
            ElevatedButton(
              child: Text('Login', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(colorPalette["alt_strong"]))),
              onPressed: () async {
                if(_formKey.currentState.validate()) {
                  if(await widget.user.apiLogin(email, password)) {
                     await toastTemplate('Logged in sucessfully');
                  } else {
                    return await toastTemplate('Login error');
                  }

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