import 'package:flutter/material.dart';

class FormInputText extends StatefulWidget {
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  FormInputText({
    this.validator,
    this.decoration,
    this.controller,
  });

  @override
  State<StatefulWidget> createState() {
    return FormInputTextState();
  }
}

class FormInputTextState extends State<FormInputText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,

          // Error style
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink[200] ?? Colors.redAccent)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink[200] ?? Colors.redAccent, width: 2)
          ),
          errorStyle: TextStyle(
            color: Colors.pink[400]
          ),

          // Hint and label
          labelText: widget.decoration?.labelText,
          hintText: widget.decoration?.hintText,
        ),
        validator: widget.validator,
      ),
    );
  }
}
