import 'package:flutter/material.dart';
import 'loginButton.dart';
import 'dashboard.dart';

class Login extends StatelessWidget {
  login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WillPopScope(
              onWillPop: () async => Navigator.of(context).pop(true),
              child: Dashboard(),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment(0.0, 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff165571),
              Color(0xff0e1823),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Text(
                'CLIMBING LOG',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: TextDecoration.none),
              ),
            ),
            LoginButton(
              label: 'Sign in with Google',
              icon: Icons.face,
              onPressed: () {
                login(context);
              },
            ),
            LoginButton(
              label: 'Sign in with Facebook',
              icon: Icons.school,
              onPressed: () {
                login(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
