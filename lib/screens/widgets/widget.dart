//import 'dart:js';

import 'package:flutter/material.dart';

Widget appBar(BuildContext context){
  return RichText(text: TextSpan(
    style: TextStyle(fontSize: 22),
    children: <TextSpan> [
      TextSpan(
        text: "kazi", 
        style: TextStyle(
          fontWeight: FontWeight.w500, 
          color: Colors.black54
        )
      ),
      TextSpan(
        text: "Manager", 
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.brown)),
    ],


  ));
}