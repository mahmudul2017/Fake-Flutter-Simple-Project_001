import 'package:flutter/material.dart';
import 'package:flutter_firstproject/login/LoginPage.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project 01',
      home: LoginPage(),
    );
  }
}

