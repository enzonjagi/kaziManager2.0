import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/authenticate/signIn.dart';
import 'package:kazimanager_withauth/screens/home/home.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/services/auth.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String u_name, email, password, confirm_pwd;
  AuthService authService = new AuthService();
  /*bool _initialized = false;
  bool _error = false;*/
  bool _isLoading = false;

  /*void initializeFlutterFire() async {
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
    super.initState();
  }*/

  signUp() async {
    await authService.initiialize();
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService.createUser(email, password).then((val) {
        if (val != null) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      });
    }
    _formKey.currentState.save();
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
                          if (val.isEmpty) {
                            return 'Email is required';
                          }

                          if (!RegExp(
                                  "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                              .hasMatch(val)) {
                            return 'Enter a valid email address';
                          }
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
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(30)),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 48,
                          child: Text(
                            "SignUp",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
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
