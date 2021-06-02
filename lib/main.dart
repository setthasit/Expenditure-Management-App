import 'package:expenditure_app/screens/first_screen/first_screen.dart';
import 'package:expenditure_app/screens/signup/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: FirstPageScreen(),
    );
  }
}
