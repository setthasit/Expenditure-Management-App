import 'package:expenditure_app/models/expense.dart';
import 'package:expenditure_app/models/user.dart';
import 'package:expenditure_app/repositorys/expense_repository.dart';
import 'package:expenditure_app/screens/dashboard/components/card_list.dart';
import 'package:expenditure_app/screens/expense_create/expense_create.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  List<Expense> _expenses = [];
  double _expenseCost = 0;

  loadExpenses() async {
    List<Expense> expenses = await ExpenseRepository.getExpenses();
    double expenseCost = 0;

    expenses.forEach((element) {
      print(element);
      expenseCost += element.amount;
    });

    setState(() {
      _expenses = expenses;
      _expenseCost = expenseCost;
    });
  }

  goToCreateExpense() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ExpenseCreateScreen(
          notifySuccess: loadExpenses,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();

    loadExpenses();
  }

  Widget expenseList() {
    List<Widget> list = [];

    _expenses.forEach((element) {
      list.add(ExpenseCardList(
        title: element.title,
        amount: element.amount,
        leadIcon: Icon(Icons.arrow_downward_rounded, color: Colors.pink[400])
      ));
    });

    return Column(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome " + widget.user.username + "!"),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                    onPressed: goToCreateExpense,
                    child: Text("Create Expense/Extra"),
                  ),
                )
              ],
            ),
            Text("Your Income: " + widget.user.baseIncome.toString()),
            Text("Your Expense: " + _expenseCost.toString()),
            Text("Your Balance: " + (widget.user.baseIncome - _expenseCost).toString()),
            Column(children: [expenseList()])
          ],
        ),
      ),
    );
  }
}
