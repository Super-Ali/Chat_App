import 'package:chat_app/Shared/Constants.dart';
import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFee7b64), width: 2)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFee7b64), width: 2)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFee7b64), width: 2)));

void nextScreen(context, page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

void showSnackBar(context, color, messege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      messege,
      style: const TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 6),
    action: SnackBarAction(
      label: "OK",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}
