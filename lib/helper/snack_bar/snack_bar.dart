import 'package:flutter/material.dart';

class GenerateSnackBar {

  SnackBar error (String message) {
    return SnackBar(
      content: Text(message, style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      )),
      backgroundColor: Colors.pink[400],
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

}