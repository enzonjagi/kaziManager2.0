import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kazimanager2/screens/loading.dart';
import 'package:kazimanager2/screens/userinterfaces/createtask.dart';
import 'package:kazimanager2/screens/userinterfaces/dashboard.dart';
import 'package:kazimanager2/screens/userinterfaces/reportlist.dart';
import 'package:kazimanager2/screens/userinterfaces/tasklist.dart';
import 'package:kazimanager2/screens/userinterfaces/taskpage.dart';

import 'screens/authentiction/sign_in.dart';
import 'screens/authentiction/sign_in.dart';

void main() {
  runApp(MaterialApp(
    home: SignIn(),
    debugShowCheckedModeBanner: false,
    initialRoute: "/tasklist",
    routes: {
      //'/dashboard': (context) => DashBoard(),
      '/tasklist': (context) => TaskList(),
      '/createtask': (context) => CreateTask(),
      '/opentask': (context) => OpenTask(),
      '/reportlist': (context) => ReportList(),
      '/taskreport': (context) => ReportList(),
      '/signIn': (context) => SignIn(),

    },

  ));
}


