import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/authenticate/signUp.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kazimanager_withauth/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  UserCredential userCredential ;
  signIn(){
    if(_formKey.currentState.validate()){
      //userCredential.signInEmail


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formKey,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Spacer(),
                TextFormField(
                  validator: (val) {
                    return val.isEmpty ? "Enter correct email" : null;
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
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    //sign in button; logs user in
                    signIn();

                  },
                  child: Container(
                    color: Colors.brown,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(30)),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 48,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Not registered?", style: TextStyle(fontSize: 15)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => SignUp()
                        )
                      );
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
