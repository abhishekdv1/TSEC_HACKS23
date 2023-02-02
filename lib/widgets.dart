import 'package:barter_app/constants.dart';
import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20)),
    borderSide: BorderSide(color: cardColor, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20)),
    borderSide: BorderSide(color: cardColor, width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20)),
    borderSide: BorderSide(color: cardColor, width: 2),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => page)));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: ((context) => page)));
}
