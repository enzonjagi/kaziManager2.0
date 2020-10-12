//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kazimanager_withauth/helper/functions.dart';
import 'package:kazimanager_withauth/screens/authenticate/signIn.dart';
import 'package:kazimanager_withauth/screens/authenticate/signUp.dart';
import 'package:kazimanager_withauth/screens/widgets/widget.dart';
import 'package:kazimanager_withauth/screens/wrapper.dart';
import 'package:kazimanager_withauth/screens/home/home.dart';
import 'package:kazimanager_withauth/services/auth.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //add code to check whether user is logged in

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (_) => AuthService(FirebaseAuth.instance)
          ),

          StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges,
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.brown[100],
            visualDensity: VisualDensity.adaptivePlatformDensity
          ),
          home: AuthWrapper(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null){
      return Home();
    }
    return SignIn();
  }
}
