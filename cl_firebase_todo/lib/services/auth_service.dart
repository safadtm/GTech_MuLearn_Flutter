import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final storage = const FlutterSecureStorage();

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      storeTokenAndData(credential);
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

      storeTokenAndData(credential);
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

  ///////
  Future<void> storeTokenAndData(UserCredential userCredential) async {
    await storage.write(key: "uid", value: userCredential.user!.uid.toString());
    await storage.write(key: "userCredntial", value: userCredential.toString());
    // print(userCredential.toString());
  }

  ////
  Future<String?> getToken() async {
    return await storage.read(key: "uid");
  }

  ////
  Future<void> signout({required BuildContext context}) async {
    try {
      await _auth.signOut();
      await storage.delete(key: "uid");
    } catch (e) {
      print("Sign Out: ${e.toString()}");
    }
  }
}
