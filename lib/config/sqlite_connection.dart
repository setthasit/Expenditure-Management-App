import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:expenditure_app/helper/exeptions/database/connect_fail.dart';
import 'package:expenditure_app/helper/exeptions/database/migrate_exception.dart';
import 'package:expenditure_app/models/expense.dart';
import 'package:expenditure_app/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class SqliteConnection {
  static Database? _database;
  SqliteConnection._();
  static final SqliteConnection dbProvider = SqliteConnection._();

  Future<Database> get database async {
    return _database ??= await initDB();
  }

  initDB () async {
    try {
      return openDatabase(
        join(await getDatabasesPath(), 'expenditure_management.db'),
        version: 1,
        onCreate: (Database db, int version) async {
          migrateDB(db);
      });
    } catch (e) {
      log(e.toString());
      throw new DatabaseConnectionException("cannot connect to database!");
    }
  }

  migrateDB (Database db) {
    log('migrating database...');
    
    try {
      // migrating expenditure table
      db.execute(
        Expense.entity.toMigrateString(),
      );

      // migrating user table
      db.execute(
        User.entity.toMigrateString(),
      );
    } catch (e) {
      log(e.toString());
      throw new TableMigrationException("database migration failed!");
    }

    log('database migrated!');
  }
}