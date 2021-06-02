import 'package:expenditure_app/models/entity.dart';

class Expense implements Entity {
  String tableName = "expenses";
  // call as empty instance
  // mainly use for database migration
  Expense.e();
  static final Expense entity = Expense.e();

  late int id;
  late String title;
  late double amount;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "amount": amount,
    };
  }

  @override
  String toMigrateString() {
    return '''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY,
        title TEXT,
        amount DOUBLE
      );
    ''';
  }
}