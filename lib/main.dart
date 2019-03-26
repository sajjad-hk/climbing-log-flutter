import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';

class ClimbingLogsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    // focusNode.addListener(() => debugPrint('un focuse'));
    FocusScope.of(context).requestFocus(focusNode);
    return MaterialApp(
      title: 'Login',
      home: Login(),
    );
  }
}

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(ClimbingLogsApp());
}
