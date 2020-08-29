import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarBack extends StatelessWidget  {

  String appbartitle;
  AppBarBack({this.appbartitle});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //pops the navigator off
            Navigator.pop(context);
          },)
    );
  }
}

//create cutom widgets here
class AppBarSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            //opens options menu to edit the task

            
          },),
    );
  }
}
