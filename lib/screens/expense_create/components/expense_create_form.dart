import 'package:expenditure_app/components/FormInputNumber/form_input_number.dart';
import 'package:expenditure_app/components/FormInputText/form_input_text.dart';
import 'package:expenditure_app/helper/input_validation/text_validator.dart';
import 'package:expenditure_app/helper/snack_bar/snack_bar.dart';
import 'package:expenditure_app/models/expense.dart';
import 'package:expenditure_app/repositorys/expense_repository.dart';
import 'package:flutter/material.dart';

class ExpenseCreateForm extends StatefulWidget {
  ExpenseCreateForm({
    Key? key,
    required this.notifySuccess
  }) : super(key: key);

  final Function() notifySuccess;

  @override
  State<StatefulWidget> createState() {
    return ExpenseCreateFormState();
  }
}

class ExpenseCreateFormState extends State<ExpenseCreateForm> {

  final _expenseCreateFormKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  onSubmitPress () async {
    if (_expenseCreateFormKey.currentState!.validate()) {
      try {
        ExpenseRepository.createExpense(Expense(
          id: 0,
          title: titleController.text,
          amount: double.parse(amountController.text),
        ));
        widget.notifySuccess();
        Navigator.pop(context);
      } catch (e) {
        errorSnackBar("Create expense failed!");
      }
    }
  }

  errorSnackBar(String message) {
    ScaffoldMessenger.of(context)
      .showSnackBar(GenerateSnackBar().error(message));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _expenseCreateFormKey,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            FormInputText(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Title of the expense',
              ),
              validator: (val) => TextValidator().validateRequired('title', val),
            ),
            FormInputNumber(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                hintText: 'Amount of expense 150, 1000 etc.',
              ),
              validator: (val) => TextValidator().validateRequired('amount', val),
            ),
            ElevatedButton(
              onPressed: onSubmitPress,
              child: Text('Create'),
            ),
          ],
        ),
      )
    );
  }

}