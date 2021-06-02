import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInputNumber extends StatefulWidget {
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  FormInputNumber({
    this.validator,
    this.decoration,
    this.controller,
  });

  @override
  State<StatefulWidget> createState() {
    return FormInputNumberState();
  }
}

class FormInputNumberState extends State<FormInputNumber> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        ],
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

          // Hint & Label
          labelText: widget.decoration?.labelText,
          hintText: widget.decoration?.hintText,
        ),
        validator: widget.validator,
      )
    );
  }
}
