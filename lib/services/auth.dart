import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  //instance of firebase auth

  final FirebaseAuth _auth;

  AuthService(this._auth);

  //check for auth changes
  Stream<User> get authStateChanges => _auth.authStateChanges();

  //sign in anon

  Future<String> signInAnon() async {
    await _auth.signInAnonymously();
    return "Signed in anonymously";
  }

  //signin email and password
  Future<String> signInEmailandPass(String email, password) async {
    //await _initialization;
    try {
      //await _initialization;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user.');
      }
    }
  }

  //register with email and password
  Future<String> createUser(String email, password) async {
    //await _initialization;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //email verification
  //correct it and add the flutter fire verification code block later
  dynamic verifyEmail() async {
    User user = _auth.currentUser;
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  //signout
  Future<void> signOut() async {
    
    await _auth.signOut();
  }

  //google sign in

  //phone sign in

}
