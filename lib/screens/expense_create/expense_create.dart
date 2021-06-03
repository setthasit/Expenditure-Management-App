import 'package:expenditure_app/screens/expense_create/components/expense_create_form.dart';
import 'package:flutter/material.dart';

class ExpenseCreateScreen extends StatefulWidget {
  ExpenseCreateScreen({
    Key? key,
    required this.notifySuccess
  }) : super(key: key);

  final Function() notifySuccess;

  @override
  State<StatefulWidget> createState() {
    return ExpenseCreateScreenState();
  }
}

class ExpenseCreateScreenState extends State<ExpenseCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Expense"),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(10),
        child: Column(
          children: [
            ExpenseCreateForm(
              notifySuccess: widget.notifySuccess,
            )
          ],
        ),
      ),
    );
  }
}
