//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/helper/functions.dart';
import 'package:kazimanager_withauth/screens/authenticate/signUp.dart';
import 'package:kazimanager_withauth/screens/home/home.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kazimanager_withauth/services/auth.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  
  

  //final FirebaseAuth _auth = FirebaseAuth.instance;

  //TODO find the new FlutterFire implementation on this
  

  AuthService authService;
  bool _isLoading = false;

  void signIn() async {
    //await authService.initiialize();
    if (_formKey.currentState.validate()) {
      //userCredential.signInEmail
      //UserCredential userCredential
      //TODO find the new FlutterFire implementation on this
      /*Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));*/
      

      setState(() {
        _isLoading = true;
      });
      

      await authService.signInEmailandPass(email, password).then((val) {
        if (val != null) {
          //TODO add the check for email and password correctness
          setState(() {
            _isLoading = false;
          });
          HelperFunctions.saveUserLoggedInDetails(isLoggedIn: true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      });
    }
    //_formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: appBar(context, "kazi", "Manager"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        centerTitle: true,
      ),
      body: _isLoading
          ? Container(
              child: Center(
              //before the login completes
              child: CircularProgressIndicator(),
            ))
          : Form(
              key: _formKey,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Spacer(),
                      TextFormField(
                        validator: (val) {
                          return val.isEmpty && !RegExp(
                                  "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                              .hasMatch(val) ? 'Valid email is required' : null;
                        },
                        decoration: InputDecoration(hintText: "Email"),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(height: 6),
                      TextFormField(
                        validator: (val) {
                          return val.isEmpty ? "Enter correct password" : null;
                        },
                        decoration: InputDecoration(hintText: "password"),
                        onChanged: (val) {
                          password = val;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          //sign in button; logs user in
                          
                          signIn();
                        },
                        child: blueButton(context: context, label:"Login"),
                      ),
                      SizedBox(height: 16),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Not registered?",
                                style: TextStyle(fontSize: 15)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text("SignUp",
                                  style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.underline)),
                            ),
                          ]),
                      SizedBox(height: 80)
                    ],
                  )),
            ),
    );
    //here
  }
}
