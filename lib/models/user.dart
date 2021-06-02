import 'package:expenditure_app/models/entity.dart';

class User extends Entity {
  String tableName = "user";
  // call as empty instance
  // mainly use for database migration
  User.e();
  static final User entity = User.e();

  late String username;
  late double baseIncome;

  User({
    required this.username,
    required this.baseIncome,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "baseIncome": baseIncome,
    };
  }

  @override
  String toString() {
    return '''User {
      username: $username,
      baseIncome: $baseIncome,
    }''';
  }

  @override
  String toMigrateString() {
    return '''
      CREATE TABLE $tableName(
        username TEXT,
        baseIncome DOUBLE
      );
    ''';
  }
}