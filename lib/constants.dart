import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const Map<String, dynamic> colorPalette = {
  "primary": 0xffef5200,
  "secondary": 0xfffe6900,
  //this color is literally called "beer"
  "bcg": 0xfffe8714,
  "bcg_secondary": 0xfffd754d,
  "strong": 0xfffd5e53,
  "alt_strong": 0xfffa4536
};

final InputDecoration textInputFieldDecoration = InputDecoration(
  fillColor: Color(colorPalette["bcg"]),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(colorPalette["bcg_secondary"]), width: 2)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(colorPalette["alt_strong"]), width: 2)
  ),
  hintStyle: TextStyle(color: Color.fromARGB(221, 255, 255, 255))
);

Future<bool> toastTemplate(String msg) async {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.orange[600],
    textColor: Colors.white,
    fontSize: 18
  );
}

final Center loading = Center(
  child: RotatedBox(
    quarterTurns: 1,
    child: SpinKitPianoWave(
      color: Color(colorPalette["alt_strong"]),
      size: 150.0,
    ),
  )
);

final IconButton remoteArrow = IconButton(
  iconSize: 50,
  color: Colors.white,
);
