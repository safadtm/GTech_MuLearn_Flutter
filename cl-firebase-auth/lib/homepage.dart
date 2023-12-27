import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthenticationScreen({super.key});

 Future<UserCredential?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      return await _auth.signInWithCredential(credential);
    }
  } catch (e) {
    print('Error signing in with Google: $e');
    return null;
  }
  return null;
}

  Future<UserCredential?> signInAnonymously() async {
  try {
    return await _auth.signInAnonymously();
  } catch (e) {
    print('Error signing in anonymously: $e');
    return null;
  }
}

  void _handleGoogleSignIn(BuildContext context) async {
    UserCredential? userCredential = await signInWithGoogle();
    if (userCredential != null) {
      // Navigate to another screen or perform actions after successful sign-in
      // For example:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Handle sign-in failure
      // Show error message, etc.
    }
  }

  void _handleAnonymousSignIn(BuildContext context) async {
    UserCredential? userCredential = await signInAnonymously();
    if (userCredential != null) {
      // Navigate to another screen or perform actions after successful sign-in
      // For example:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Handle sign-in failure
      // Show error message, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _handleGoogleSignIn(context),
              child: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleAnonymousSignIn(context),
              child: const Text('Sign in Anonymously'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

   HomeScreen({super.key});

  void _signOut(BuildContext context) async {
    await _auth.signOut();
    // Navigate to authentication screen or perform other actions after sign-out
    // For example:
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome!'),
      ),
    );
  }
}