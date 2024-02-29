import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'dart:js';

class Authentication extends ChangeNotifier {
  late String userID;

  String getUserID() {
    return userID;
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future loginInAccount(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      userID = credential.user!.uid;
      print('User id is = ' + userID);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future createNewAccount(String email, String password) async {
    try {
      print(email + password);
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      userID = credential.user!.uid;
      print('User id is = ' + userID);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
