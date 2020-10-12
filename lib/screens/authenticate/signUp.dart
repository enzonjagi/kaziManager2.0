import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/helper/functions.dart';
import 'package:kazimanager_withauth/screens/authenticate/signIn.dart';
import 'package:kazimanager_withauth/screens/home/home.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/services/auth.dart';
import 'package:kazimanager_withauth/services/database.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String u_name, email, password, confirm_pwd;
  AuthService authService = new AuthService();
  DatabaseService databaseService = new DatabaseService();
  bool _isLoading = false;
  DatabaseService dbService = new DatabaseService();
  

  signUp() async {
    //await authService.initiialize();
    if (_formKey.currentState.validate()) {
            setState(() {
        _isLoading = true;
      });

      //adding a map to user collection
      //add user to user collection in Firestore
      Map<String, String> userData = {
        "username": u_name,
        "email": email,
        "password": password
      };
      
      //create a user
      await authService.createUser(email, password).then((val) async {
        if (val != null) {
          setState(() {
            _isLoading = false;
          });
          HelperFunctions.saveUserLoggedInDetails(isLoggedIn: true);

          await databaseService.addUserData(userData, u_name);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        }
      });

      
      await databaseService.addUserData(userData, u_name).then((value) => null);

    }
    _formKey.currentState.save();
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
                          return val.isEmpty ? "Please fill this field" : null;
                        },
                        decoration: InputDecoration(hintText: "Username"),
                        onChanged: (val) {
                          u_name = val;
                        },
                      ),
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
                          //should register the user
                          signUp();
                        },
                        child: blueButton(context: context, label:"SignUp"),
                      ),
                      SizedBox(height: 16),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already registered?",
                                style: TextStyle(fontSize: 15)),
                            GestureDetector(
                              onTap: () {
                                //tap this to go to signin screen
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                              child: Text("SignIn",
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
