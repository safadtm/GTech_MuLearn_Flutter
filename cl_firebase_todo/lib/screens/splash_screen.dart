import 'package:cl_firebase_todo/constants/colors.dart';
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
      const Duration(seconds: 3),
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
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()), // Replace with your sign-in page
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome To ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
             Text(
              "Todos",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: tdBlue
              ),
            ),
          ],
        ),
      ),
    );
  }
}
