import 'dart:developer';

import 'package:expenditure_app/config/sqlite_connection.dart';
import 'package:expenditure_app/models/expense.dart';
import 'package:sqflite/sqflite.dart';

class ExpenseRepository {

  static Future<List<Expense>> getExpenses() async {
    final db = await SqliteConnection.dbProvider.database;
    final List<Map<String, dynamic>> maps = await db.query(
      Expense.entity.tableName,
    );

    return List.generate(maps.length, (index) {
      return Expense(
        id: maps[index]['id'],
        title: maps[index]['title'],
        amount: maps[index]['amount'],
      );
    });
  }

  static Future<Expense> createExpense(Expense expense) async {
    final db = await SqliteConnection.dbProvider.database;

    try {
      await db.insert(
        Expense.entity.tableName,
        expense.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return expense;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

}