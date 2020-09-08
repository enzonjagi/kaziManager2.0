//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/helper/functions.dart';
import 'package:kazimanager_withauth/screens/authenticate/signIn.dart';
import 'package:kazimanager_withauth/screens/authenticate/signUp.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/screens/wrapper.dart';
import 'package:kazimanager_withauth/screens/home/home.dart';
import 'package:progress_indicators/progress_indicators.dart';

void main() {
  runApp(App()
    
    /*MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  )*/
  );
}

//TODO: the firebase initializeapp must be first called before the main app is displayed 
//todo uncomment th code below for this to happen then run the call to App class above

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;
  bool _isLoggedin = false;

  //check if user is loggedin
  checkUserLoggedInStatus() async {
    _isLoggedin = await HelperFunctions.getuserLoggedInDetails().then((value) {
      setState(() {
        _isLoggedin = value;
      });
    });
  }

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    checkUserLoggedInStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Container(
          child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
      ));
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Container(
          child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.green,
        ),
      ));
    }
    return MaterialApp(
      home: (_isLoggedin ?? false) ? Home() : SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}

