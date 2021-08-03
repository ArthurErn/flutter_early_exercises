import 'package:flutter/material.dart';
import 'ui/home_page.dart';
import 'ui/gif_page.dart';
void main(){
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
    hintColor: Colors.white,
    primaryColor: Colors.white,
    cursorColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.purple[700])),
      hintStyle: TextStyle(color: Colors.white),
    )),
  ));
}