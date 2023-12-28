import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;

  const SplashScreen({Key? key, this.child}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    AuthClass _authClass = AuthClass();

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  void checkLoginStatus() async {
    String? uid = await _authClass.getToken();
    if (uid != null) {
      navigateToHome();
    } else {
      navigateToSignIn();
    }
  }

  void navigateToHome() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
        );
      },
    );
  }

  void navigateToSignIn() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()), // Replace with your sign-in page
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome To Todos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
