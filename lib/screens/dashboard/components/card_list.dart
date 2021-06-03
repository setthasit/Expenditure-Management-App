import 'package:flutter/material.dart';

class ExpenseCardList extends StatelessWidget {
  ExpenseCardList({
    required this.title,
    required this.amount,
    required this.leadIcon,
  });

  final String title;
  final double amount;
  final Icon leadIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: leadIcon,
            title: Text(title),
            subtitle: Text(amount.toString()),
          ),
        ],
      ),
    );
  }
}