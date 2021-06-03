import 'dart:developer';

import 'package:expenditure_app/models/user.dart';
import 'package:expenditure_app/repositorys/user_repository.dart';
import 'package:expenditure_app/screens/dashboard/dashboard.dart';
import 'package:expenditure_app/screens/main/main.dart';
import 'package:expenditure_app/screens/signup/signup.dart';
import 'package:flutter/material.dart';

class FirstPageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPageScreenState();
  }
}

class FirstPageScreenState extends State<FirstPageScreen> {
  Future checkUserExist () async {
    User? user = await UserRepository.getUser();
    if (user == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => SignUpScreen(),
      ));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => DashboardScreen(user: user),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      checkUserExist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Loading..."),
            )
          ],
        ),
      ),
    );
  }
}
