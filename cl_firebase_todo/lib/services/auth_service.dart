import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final storage = FlutterSecureStorage();

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential =await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Sign UP: " + e.toString());
    }
  }

   Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential =await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Sign In: " + e.toString());
    }
  }
}
