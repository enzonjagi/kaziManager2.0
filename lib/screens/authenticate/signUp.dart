import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/screens/authenticate/signIn.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String u_name, email, password, confirm_pwd;

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
                    return val.isEmpty ? "Please fill this field" : null;
                  },
                  decoration: InputDecoration(hintText: "Username"),
                  onChanged: (val) {
                    u_name = val;
                  },
                ),
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
                    //should register the user
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
                      "SignUp",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Already registered?", style: TextStyle(fontSize: 15)),
                  GestureDetector(
                    onTap: () {
                      //tap this to go to signin screen
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => SignIn()
                        )
                      );
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
