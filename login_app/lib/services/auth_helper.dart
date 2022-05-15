import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;

  //SIGN UP
  Future signUp({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN
  Future signIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SIGN OUT
  Future signOut() async {
    await auth.signOut();

    if (kDebugMode) {
      print('signout');
    }
  }
}
