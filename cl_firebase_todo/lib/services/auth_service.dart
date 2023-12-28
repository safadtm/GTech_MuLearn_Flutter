import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../widgets/toast.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final storage = FlutterSecureStorage();

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
       if (e.code == 'email-already-in-use') {
        // showToast(message: 'The email address is already in use.');
        print("The email address is already in use.");
      } else {
        // showToast(message: 'An error occurred: ${e.code}');
        print("An error occured: ${e.code}");
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // showToast(message: 'The email address is already in use.');
        print("The email address is already in use.");
      } else {
        // showToast(message: 'An error occurred: ${e.code}');
        print("An error occured: ${e.code}");
      }
    }
  }
}
