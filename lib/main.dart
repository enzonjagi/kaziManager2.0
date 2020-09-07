//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/authenticate/signIn.dart';
import 'package:kazimanager_withauth/screens/authenticate/signUp.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/screens/wrapper.dart';
import 'package:progress_indicators/progress_indicators.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: appBar(context),
          backgroundColor: Colors.transparent,
          elevation: 2.0,
          brightness: Brightness.light,
        ),
        body: FutureBuilder(
          future: _initialization,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Container(
                  child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                child: Center(
                  child: SafeArea(
                      child: Column(
                    children: [
                      RaisedButton(
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          color: Colors.brown,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          }),
                          SizedBox(height: 10,),
                          Text(
                            "Or",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 10,),
                      FlatButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Center(
                            child: Text(
                              "SignUp",
                              style: TextStyle(color: Colors.brown)
                            ),
                          ))
                    ],
                  )),
                ),
              );
            } else {
              return Container(
                  child: Center(
                child:
                    HeartbeatProgressIndicator(child: Icon(Icons.account_box)),
              ));
            }
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
