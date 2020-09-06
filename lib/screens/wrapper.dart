import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/home/home.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //should return home or auth dependent on siginin
    return Home();
  }
}