import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  //instance of firebase auth
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  //check for auth changes
  dynamic checkAuth(String email, password) async{
    //await _initialization;
    await _auth.authStateChanges().listen((User user) {
      if (user == null){
        print("User is currently signed out");
      }else{
        print("User is signed in");
        return user;
      }
     });
  }


  //sign in anon
  Future initiialize() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails

    }
  }

  dynamic signInAnon() async {
    UserCredential userCredential = await _auth.signInAnonymously();
    return userCredential;
  }

  //signin email and password
  dynamic signInEmailandPass(String email, password) async {
    //await _initialization;
    try {
      //await _initialization;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //register with email and password
  dynamic createUser(String email, password) async {
    //await _initialization;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //email verification
  //correct it and add the flutter fire verification code block later
  /*dynamic verifyEmail() async {
    User user = _auth.currentUser;
    if(!user.emailVerified){
      await user.sendEmailVerification();
    }

  }*/

  //signout
  dynamic signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //google sign in

  //phone sign in

}
