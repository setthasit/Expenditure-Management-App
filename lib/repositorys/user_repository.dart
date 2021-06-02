import 'dart:developer';

import 'package:expenditure_app/config/sqlite_connection.dart';
import 'package:expenditure_app/helper/exeptions/database/operation_fail.dart';
import 'package:expenditure_app/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {

  Future<User?> getUser() async {
    final db = await SqliteConnection.dbProvider.database;
    final List<Map<String, dynamic>> maps = await db.query(
      User.entity.tableName,
      limit: 1
    );

    return maps.length < 1 ? null : User(
      username: maps[0]['username'],
      baseIncome: maps[0]['baseIncome'],
    );
  }

  Future<User> createUser(User user) async {
    final db = await SqliteConnection.dbProvider.database;

    try {
      await db.insert(
        User.entity.tableName,
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return user;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

}