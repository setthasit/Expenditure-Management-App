import 'package:expenditure_app/components/FormInputNumber/form_input_number.dart';
import 'package:expenditure_app/components/FormInputText/form_input_text.dart';
import 'package:expenditure_app/helper/exeptions/database/connect_fail.dart';
import 'package:expenditure_app/helper/exeptions/database/migrate_exception.dart';
import 'package:expenditure_app/helper/exeptions/database/operation_fail.dart';
import 'package:expenditure_app/helper/snack_bar/snack_bar.dart';
import 'package:expenditure_app/models/user.dart';
import 'package:expenditure_app/repositorys/user_repository.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {

  final _signupFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final incomeController = TextEditingController();

  String? validateEmpty(String name, String? val) {
    if (val == null || val.isEmpty) {
      return '$name is required';
    }
    return null;
  }

  onSubmitPress () async {
    if (_signupFormKey.currentState!.validate()) {
      try {
        UserRepository().createUser(User(
          username: usernameController.text,
          baseIncome: double.parse(incomeController.text),
        ));
      } on TableMigrationException catch (e) {
        errorSnackBar(e.message);
      } on DatabaseConnectionException catch (e) {
        errorSnackBar(e.message);
      } on DatabaseOperationFailException catch (e) {
        errorSnackBar(e.message);
      } catch (e) {
        print(e);
        errorSnackBar("I don't know this error...");
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
      key: _signupFormKey,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            FormInputText(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'your username',
              ),
              validator: (val) => validateEmpty('username', val),
            ),
            FormInputNumber(
              controller: incomeController,
              decoration: InputDecoration(
                labelText: 'Base Income',
                hintText: 'Salary etc.',
              ),
              validator: (val) => validateEmpty('base income', val),
            ),
            ElevatedButton(
              onPressed: onSubmitPress,
              child: Text('Sign Up!'),
            ),
          ],
        ),
      )
    );
  }

}