import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const textInputFieldDecoration = InputDecoration(
  fillColor: Color.fromARGB(255, 235, 220, 177),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellow, width: 2)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 2)
  ),
);

Future<bool> toastTemplate(String msg) async {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.orange[200],
    textColor: Colors.white,
    fontSize: 16
  );
}