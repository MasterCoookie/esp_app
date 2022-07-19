import 'package:flutter/material.dart';

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